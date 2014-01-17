//
//  MainCell.h
//  TW+
//
//  Created by Dennis Yang on 13-7-16.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MainCell;

@protocol MainCellDelegate <NSObject>

- (void)didSelectMainCell:(MainCell *)mainCell;

@end



@interface MainCell : UIView
{
    IBOutlet __unsafe_unretained id<MainCellDelegate> _delegate;
}

@property (nonatomic, unsafe_unretained) id<MainCellDelegate> delegate;

@end
