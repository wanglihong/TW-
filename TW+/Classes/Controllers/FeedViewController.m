//
//  FeedViewController.m
//  TW+
//
//  Created by Dennis Yang on 13-7-16.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import "FeedViewController.h"
#import "AppDelegate.h"
#import "Brand.h"

@interface FeedViewController ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation FeedViewController

@synthesize fetchedResultsController=_fetchedResultsController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* boldFontName = @"Avenir-Black";
    [self styleNavigationBarWithFontName:boldFontName];
    self.title = @"Feed";
}

#pragma mark -
#pragma mark UICollectionViewDataSource / UICollectionViewDelegate Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    Brand *brand = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    UILabel* label = (UILabel*)[cell viewWithTag:1];
    label.text = brand.name;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        
        UILabel* label = (UILabel*)[headerView viewWithTag:1];
        
        label.text = [[[self.fetchedResultsController sections] objectAtIndex:indexPath.section] name];
        label.font = [UIFont fontWithName:@"Avenir-Black" size:18.0f];
        UIColor* mainColor = [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:1.0f];
        label.textColor = mainColor;
        
        reusableview = headerView;
    }
    
    
    return reusableview;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"FeedStoryboard" bundle:nil];
//    FeedController* controller = [storyboard instantiateInitialViewController];
//    [self presentViewController:controller animated:YES completion:nil];
}

- (void)styleNavigationBarWithFontName:(NSString*)navigationTitleFont
{
    CGSize size = CGSizeMake(320, 44);
    UIColor* color = [UIColor whiteColor];
    
    UIGraphicsBeginImageContext(size);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGRect fillRect = CGRectMake(0,0,size.width,size.height);
    CGContextSetFillColorWithColor(currentContext, color.CGColor);
    CGContextFillRect(currentContext, fillRect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    // To apply image to all your navigation bars, use the appearance proxy:
    //UINavigationBar* navAppearance = [UINavigationBar appearance];
    // For an individual bar:
    UINavigationBar* navAppearance = self.navigationController.navigationBar;
    [navAppearance setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [navAppearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                           [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:1.0f], UITextAttributeTextColor,
                                           [UIFont fontWithName:navigationTitleFont size:18.0f], UITextAttributeFont, [NSValue valueWithCGSize:CGSizeMake(0.0, 0.0)], UITextAttributeTextShadowOffset,
                                           nil]];
    
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setFrame:CGRectMake(0, 0, 30, 20)];
    [searchBtn setImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
    UIBarButtonItem* searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    self.navigationItem.rightBarButtonItem = searchItem;
    
    
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [menuBtn addTarget:self action:@selector(menu:) forControlEvents:UIControlEventTouchUpInside];
    [menuBtn setFrame:CGRectMake(0, 0, 30, 20)];
    [menuBtn setImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
    
    self.navigationItem.leftBarButtonItem = menuItem;
}


#pragma mark -
#pragma mark Fetched results controller

/*
 Returns the fetched results controller. Creates and configures the controller if necessary.
 */
- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSManagedObjectContext *context = [AppDelegate delegate].managedObjectContext;
    
    // Create and configure a fetch request with the Book entity.
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Brand" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    // Create the sort descriptors array.
    NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:nameDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Create and initialize the fetch results controller.
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:@"team" cacheName:@"Root"];
    _fetchedResultsController.delegate = self;
    
    // Memory management.
    
    return _fetchedResultsController;
}


#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
