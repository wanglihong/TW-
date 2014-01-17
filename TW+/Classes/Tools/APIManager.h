//
//  APIManager.h
//  AFNetworkDemo
//
//  Created by Dennis Yang on 13-5-21.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import "AFHTTPClient.h"

@interface APIManager : AFHTTPClient

+ (void)getCityListWithBlock:(void (^)(NSArray *cityList))block;

+ (void)getBrandListWithBlock:(void (^)(NSArray *brandList))block;

+ (void)getDocumentListWithBlock:(void (^)(NSArray *documentList))block;

@end
