//
//  CreateProfileViewController.m
//  Peek-a-Boo
//
//  Created by David Warner on 6/5/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "CreateProfileViewController.h"


@interface CreateProfileViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *telephoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UISwitch *premiumSubSwitch;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;


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


    [self.managedObjectContextFromSource save:nil];

}

-(void)dismissKeyboard
{
    [self.view endEditing:YES];
}


@end
