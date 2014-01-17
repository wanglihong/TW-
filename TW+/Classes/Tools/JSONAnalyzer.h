//
//  JSONAnalyzer.h
//  AFNetworkDemo
//
//  Created by Dennis Yang on 13-5-22.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONAnalyzer : NSObject

+ (NSArray *)analyzeCityListFromJSON:(id)json;

+ (NSArray *)analyzeBrandListFromJSON:(id)json;

+ (NSArray *)analyzeDocumentListFromJSON:(id)json;

@end
