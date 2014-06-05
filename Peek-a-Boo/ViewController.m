//
//  ViewController.m
//  Peek-a-Boo
//
//  Created by David Warner on 6/5/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "CreateProfileViewController.h"
#import "User.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    self.fetchedResultsController.delegate = self;
    [self.fetchedResultsController performFetch:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreateProfileViewController *destinationVC= segue.destinationViewController;
    destinationVC.managedObjectContextFromSource = self.managedObjectContext;
}


@end
