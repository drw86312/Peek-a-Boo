//
//  EditViewController.m
//  Peek-a-Boo
//
//  Created by Richard Fellure on 6/5/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *telephoneTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *editPictureButton;
@property (weak, nonatomic) IBOutlet UIButton *saveChangesButton;
@property NSData *picData;

@end

@implementation EditViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.imageView.image = [UIImage imageWithData:self.userEdit.profilepic];
    self.nameTextField.text = self.userEdit.name;
    self.ageTextField.text = self.userEdit.age.description;
    self.addressTextField.text = self.userEdit.address;
    self.cityTextField.text = self.userEdit.city;
    self.stateTextField.text = self.userEdit.state;
    self.zipTextField.text = self.userEdit.zipcode.description;
    self.emailTextField.text = self.userEdit.email;
    self.telephoneTextField.text = self.userEdit.phone;

    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyBoard)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
}

- (IBAction)saveEditChangesOnButtonPressed:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Are You Sure You Want To Save Your Changes?" message:nil delegate:self cancelButtonTitle:@"Save Changes" otherButtonTitles:@"Cancel", nil];
    [alertView show];
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

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == alertView.cancelButtonIndex)
    {
        self.userEdit.name = self.nameTextField.text;
        self.userEdit.age = @([self.ageTextField.text intValue]);
        self.userEdit.address = self.addressTextField.text;
        self.userEdit.city = self.cityTextField.text;
        self.userEdit.state = self.stateTextField.text;
        self.userEdit.zipcode = @([self.zipTextField.text intValue]);
        self.userEdit.email = self.emailTextField.text;
        self.userEdit.phone = self.telephoneTextField.text;

        self.nameTextField.borderStyle = UITextBorderStyleNone;
        self.ageTextField.borderStyle = UITextBorderStyleNone;
        self.cityTextField.borderStyle = UITextBorderStyleNone;
        self.zipTextField.borderStyle = UITextBorderStyleNone;
        self.emailTextField.borderStyle = UITextBorderStyleNone;
        self.telephoneTextField.borderStyle = UITextBorderStyleNone;
        self.stateTextField.borderStyle = UITextBorderStyleNone;
        self.addressTextField.borderStyle = UITextBorderStyleNone;

        [self.nameTextField setEnabled:NO];
        [self.ageTextField setEnabled:NO];
        [self.addressTextField setEnabled:NO];
        [self.cityTextField setEnabled:NO];
        [self.stateTextField setEnabled:NO];
        [self.zipTextField setEnabled:NO];
        [self.emailTextField setEnabled:NO];
        [self.telephoneTextField setEnabled:NO];
        [self.editPictureButton setEnabled:NO];
        [self.saveChangesButton setEnabled:NO];
        
        if (self.picData != nil)
        {
            self.userEdit.profilepic = self.picData;
        }
        else
        {
            self.userEdit.profilepic = self.userEdit.profilepic;
        }
        [self.managedObjectContextEdit save:nil];
    }
    else
    {
        [alertView dismissWithClickedButtonIndex:-1 animated:YES];
    }
}

-(void)dismissKeyBoard
{
    [self.view endEditing:YES];
}





@end
