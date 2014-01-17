//
//  FeedViewController.h
//  TW+
//
//  Created by Dennis Yang on 13-7-16.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate,NSFetchedResultsControllerDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView* collectionView;

@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout* layout;

@property (nonatomic, strong) IBOutlet UIViewController* currentViewController;

@end
