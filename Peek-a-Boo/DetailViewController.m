//
//  DetailViewController.m
//  Peek-a-Boo
//
//  Created by Richard Fellure on 6/5/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DetailViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.imageView.image = [UIImage imageWithData:self.profileUser.profilepic];
}

@end
