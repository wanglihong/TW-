//
//  NSObject+Extension.m
//  AFNetworkDemo
//
//  Created by Dennis Yang on 13-5-22.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)

void alert(NSString *text)
{
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Prompt", nil)
                                message:text
                               delegate:nil
                      cancelButtonTitle:nil
                      otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
}

@end
