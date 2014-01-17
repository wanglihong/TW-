//
//  Brand.h
//  TW+
//
//  Created by Dennis Yang on 13-7-16.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Document;

@interface Brand : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * team;
@property (nonatomic, retain) NSSet *docs;
@end

@interface Brand (CoreDataGeneratedAccessors)

- (void)addDocsObject:(Document *)value;
- (void)removeDocsObject:(Document *)value;
- (void)addDocs:(NSSet *)values;
- (void)removeDocs:(NSSet *)values;

@end
