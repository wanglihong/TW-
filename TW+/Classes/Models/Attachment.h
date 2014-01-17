//
//  Attachment.h
//  TW+
//
//  Created by Dennis Yang on 13-7-16.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Document;

@interface Attachment : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Document *doc;

@end
