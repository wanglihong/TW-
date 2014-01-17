//
//  MainViewController.m
//  TW+
//
//  Created by Dennis Yang on 13-7-12.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import "MainViewController.h"
#import "LoadingViewController.h"
#import "AppDelegate.h"
#import "Brand.h"
#import "MainCell.h"
#import "FeedViewController.h"

static CGPoint formationPoints[] = {{112, 224}, {392, 224}, {672, 224}, {112, 404}, {392, 404}, {672, 404}};

@interface MainViewController () <NSFetchedResultsControllerDelegate, MainCellDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *mainScrollView;
@property (nonatomic, strong) LoadingViewController *loadingController;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation MainViewController

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
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LoadingStoryboard" bundle:nil];
    self.loadingController = [storyboard instantiateInitialViewController];
    self.loadingController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:self.loadingController.view];
    
    
    NSError *error;
    if (![[self fetchedResultsController] performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    UIColor* mainColor = [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:1.0f];
    int idx = -1;
    for (Brand *brand in self.fetchedResultsController.fetchedObjects) {
        idx++;
        CGPoint p = formationPoints[idx];
        MainCell *cell = [[MainCell alloc] initWithFrame:CGRectMake(p.x, p.y, 240, 120)];
        cell.backgroundColor = mainColor;
        cell.delegate = self;
        [self.mainScrollView addSubview:cell];
    }
}


#pragma mark - 
#pragma mark MainCell delegate method

- (void)didSelectMainCell:(MainCell *)mainCell
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"FeedStoryboard" bundle:nil];
    FeedViewController* controller = [storyboard instantiateInitialViewController];
    [self presentViewController:controller animated:YES completion:nil];
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
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:@"Root"];
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
