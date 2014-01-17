//
//  FeedCell.m
//  TW+
//
//  Created by Dennis Yang on 13-7-16.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import "FeedCell.h"

@implementation FeedCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:15.0f];
    
    UIColor* mainColor = [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:1.0f];
    
    self.bgView.backgroundColor = mainColor;
    self.bgView.layer.cornerRadius = 3.0f;
    
}

@end
