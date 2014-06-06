//
//  EditViewController.h
//  Peek-a-Boo
//
//  Created by Richard Fellure on 6/5/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"


@interface EditViewController : UIViewController
@property User *userEdit;
@property NSManagedObjectContext *managedObjectContextEdit;


@end
