//
//  CreateProfileViewController.m
//  Peek-a-Boo
//
//  Created by David Warner on 6/5/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "CreateProfileViewController.h"


@interface CreateProfileViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *telephoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UISwitch *premiumSubSwitch;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property NSData *picData;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicImageView;


@end

@implementation CreateProfileViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (IBAction)addPhotoButtonPressed:(id)sender
{

    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];

}
- (IBAction)onCreateAccountButtonPressed:(id)sender
{
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContextFromSource];

    user.name = self.nameTextField.text;
    user.age = @([self.ageTextField.text intValue]);
    user.city = self.cityTextField.text;
    user.zipcode = @([self.zipTextField.text intValue]);
    user.email = self.emailTextField.text;
    user.phone = self.telephoneTextField.text;
    user.state = self.stateTextField.text;
    user.address = self.addressTextField.text;
    user.premiumMember = @(@(self.premiumSubSwitch.on).intValue);
    user.profilepic = self.picData;


    [self.managedObjectContextFromSource save:nil];
    self.nameTextField.text = @"";

    self.profilePicImageView.image = [UIImage imageWithData:user.profilepic];
}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{

    [picker dismissViewControllerAnimated:YES completion:nil];

    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

    self.picData = UIImagePNGRepresentation(image);
    
}

@end
