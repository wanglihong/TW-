//
//  LoadingViewController.m
//  TW+
//
//  Created by Dennis Yang on 13-7-12.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import "LoadingViewController.h"
#import "AppAPIClient.h"
#import "AppDelegate.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

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
    
    self.twLabel.textColor = [UIColor blackColor];
    self.addLabel.textColor = [UIColor blackColor];
    
    
    NSManagedObjectContext * context = [[AppDelegate delegate] managedObjectContext];
    NSArray *iccBrands = [NSArray arrayWithObjects:@"来伊份", @"红双喜", @"添柏岚", @"菲林格尔", nil];
    for (NSString *name in iccBrands) {
        NSManagedObject *brand = nil;
        brand = [NSEntityDescription insertNewObjectForEntityForName:@"Brand" inManagedObjectContext: context];
        [brand setValue:name forKey: @"name"];
        [brand setValue:@"技术部" forKey:@"team"];
    }
    
    NSArray *dfBrands = [NSArray arrayWithObjects:@"产品1", @"产品2", nil];
    for (NSString *name in dfBrands) {
        NSManagedObject *brand = nil;
        brand = [NSEntityDescription insertNewObjectForEntityForName:@"Brand" inManagedObjectContext: context];
        [brand setValue:name forKey: @"name"];
        [brand setValue:@"视频部" forKey:@"team"];
    }
    
    [[AppAPIClient sharedClient] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"AFNetworkReachabilityStatusNotReachable");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"AFNetworkReachabilityStatusReachableViaWiFi");
                [self finishLoading];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"AFNetworkReachabilityStatusReachableViaWWAN");
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"AFNetworkReachabilityStatusUnknown");
                break;
                
            default:
                break;
        }
    }];
}

- (void)finishLoading
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [self.view removeFromSuperview];
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
