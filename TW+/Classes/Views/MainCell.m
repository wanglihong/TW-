//
//  MainCell.m
//  TW+
//
//  Created by Dennis Yang on 13-7-16.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

@synthesize delegate = _delegate;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectMainCell:)]) {
        [_delegate didSelectMainCell:self];
    }
}

@end
