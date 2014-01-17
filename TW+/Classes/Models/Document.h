//
//  Document.h
//  TW+
//
//  Created by Dennis Yang on 13-7-16.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Attachment, Brand;

@interface Document : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Attachment *attachment;
@property (nonatomic, retain) Brand *brand;

@end
