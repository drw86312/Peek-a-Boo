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
#import "ProfileCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad
{
//    [super viewDidLoad];
//    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"User"];
//    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
//    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
//    self.fetchedResultsController.delegate = self;
//    [self.fetchedResultsController performFetch:nil];
//    [self.collectionView reloadData];


}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    self.fetchedResultsController.delegate = self;
    [self.fetchedResultsController performFetch:nil];
    [self.collectionView reloadData];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreateProfileViewController *destinationVC= segue.destinationViewController;
    destinationVC.managedObjectContextFromSource = self.managedObjectContext;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.fetchedResultsController.sections[section] numberOfObjects];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProfileCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    User *user = [self.fetchedResultsController objectAtIndexPath:indexPath];

    UIImage *image = [UIImage imageWithData:user.profilepic];
    cell.imageView.image = image;
    return cell;

}






@end
