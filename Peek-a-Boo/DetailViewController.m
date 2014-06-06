//
//  DetailViewController.m
//  Peek-a-Boo
//
//  Created by Richard Fellure on 6/5/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "DetailViewController.h"
#import <MapKit/MapKit.h>

@interface DetailViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *userInfoLabel;
@property NSData *picData;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *addPhotoButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *mapViewButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *editButtonOutlet;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation DetailViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.imageView.image = [UIImage imageWithData:self.profileUser.profilepic];
    self.userInfoLabel.text = [NSString stringWithFormat:@"Age: %@\nAddress: %@ %@, %@ %@\nEmail: %@\nTelephone: %@", self.profileUser.age.description, self.profileUser.address, self.profileUser.city, self.profileUser.state, self.profileUser.zipcode.description, self.profileUser.email, self.profileUser.phone];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.picData = UIImagePNGRepresentation(image);

    Photo *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:self.managedObjectContextUser];

    photo.photo = self.picData;

    [self.profileUser addPhotosObject:photo];
    [self.managedObjectContextUser save:nil];

}

- (IBAction)addPhotoButtonPressed:(id)sender
{

    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}


- (IBAction)togglePressed:(id)sender
{
    [self segmentChanged:sender];
}

- (void)segmentChanged:(id)sender
{
    switch ([sender selectedSegmentIndex]) {
        case 0:
        {
            self.scrollView.hidden = YES;
            self.userInfoLabel.hidden = NO;
            self.imageView.hidden = NO;
            self.editButtonOutlet.hidden = NO;
            self.addPhotoButtonOutlet.hidden = NO;
            self.mapViewButtonOutlet.hidden = NO;
            self.mapView.hidden = NO;
            self.view.backgroundColor = [UIColor whiteColor];

            break;
        }
        case 1:
        {
            self.scrollView.hidden = NO;
            self.userInfoLabel.hidden = YES;
            self.imageView.hidden = YES;
            self.editButtonOutlet.hidden = YES;
            self.addPhotoButtonOutlet.hidden = YES;
            self.mapViewButtonOutlet.hidden = YES;
            self.mapView.hidden = YES;
            self.view.backgroundColor = [UIColor blackColor];

            CGFloat x = 0.0;
            for (Photo *photo in self.profileUser.photos) {
                UIImageView *imageView = [[UIImageView alloc] initWithImage: [UIImage imageWithData:photo.photo]];
                [self.scrollView addSubview:imageView];
                imageView.frame = CGRectMake(x, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
                self.scrollView.contentMode = UIViewContentModeScaleAspectFit;
                x += imageView.frame.size.width;
            }

            self.scrollView.contentSize = CGSizeMake(x, self.scrollView.frame.size.height);
            self.scrollView.minimumZoomScale = 1.0;
            self.scrollView.maximumZoomScale = 6.0;
            self.scrollView.delegate = self;
            break;
        }
        default:
            break;
    }
}


@end
