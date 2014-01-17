//
//  NSObject+Extension.h
//  AFNetworkDemo
//
//  Created by Dennis Yang on 13-5-22.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

// DLog is almost a drop-in replacement for NSLog
// DLog();
// DLog(@"here");
// DLog(@"value: %d", x);
// Unfortunately this doesn't work DLog(aStringVariable); you have to do this instead DLog(@"%@", aStringVariable);
#ifdef DEBUG
#       define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#       define DLog(...)
#endif

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);


@interface NSObject (Extension)

extern void alert(NSString *text);

@end
