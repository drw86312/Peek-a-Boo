//
//  EditViewController.m
//  Peek-a-Boo
//
//  Created by Richard Fellure on 6/5/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *ageLabel;
@property (weak, nonatomic) IBOutlet UITextField *addressLabel;
@property (weak, nonatomic) IBOutlet UITextField *cityLabel;
@property (weak, nonatomic) IBOutlet UITextField *stateLabel;
@property (weak, nonatomic) IBOutlet UITextField *zipLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField *telephoneLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property NSData *picData;


@end

@implementation EditViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.imageView.image = [UIImage imageWithData:self.userEdit.profilepic];
    self.nameLabel.text = self.userEdit.name;
    self.ageLabel.text = self.userEdit.age.description;
    self.addressLabel.text = self.userEdit.address;
    self.cityLabel.text = self.userEdit.city;
    self.stateLabel.text = self.userEdit.state;
    self.zipLabel.text = self.userEdit.zipcode.description;
    self.emailLabel.text = self.userEdit.email;
    self.telephoneLabel.text = self.userEdit.phone;
    
}

- (IBAction)saveEditChangesOnButtonPressed:(id)sender
{
    self.userEdit.name = self.nameLabel.text;
    self.userEdit.age = @([self.ageLabel.text intValue]);
    self.userEdit.address = self.addressLabel.text;
    self.userEdit.city = self.cityLabel.text;
    self.userEdit.state = self.stateLabel.text;
    self.userEdit.zipcode = @([self.zipLabel.text intValue]);
    self.userEdit.email = self.emailLabel.text;
    self.userEdit.phone = self.telephoneLabel.text;
    if (self.picData != nil)
    {
         self.userEdit.profilepic = self.picData;
    }
    else
    {
        self.userEdit.profilepic = self.userEdit.profilepic;
    }
   
    
    [self.managedObjectContextEdit save:nil];
    [sender setEnabled:NO];
}

- (IBAction)editProfilePictureOnButtonPressed:(id)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.picData = UIImagePNGRepresentation(image);
    self.imageView.image = [UIImage imageWithData:self.picData];
}








@end
