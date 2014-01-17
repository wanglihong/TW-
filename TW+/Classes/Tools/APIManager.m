//
//  APIManager.m
//  AFNetworkDemo
//
//  Created by Dennis Yang on 13-5-21.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import "APIManager.h"
#import "AppAPIClient.h"
#import "JSONAnalyzer.h"
#import "NSObject+Extension.h"

typedef enum
{
    APIObtainCityList,
    APIObtainCityInfo,
} APIName;

@implementation APIManager

+ (void)getCityListWithBlock:(void (^)(NSArray *cityList))block
{
    NSMutableDictionary *params = [APIManager argu4API:APIObtainCityList];
    
    [[AppAPIClient sharedClient] postPath:nil
                               parameters:params
                                  success:^(AFHTTPRequestOperation *operation, id JSON) {
                                      block([JSONAnalyzer analyzeCityListFromJSON:JSON]);
                                  }
                                  failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                      alert(error.description);
                                  }];
}

+ (void)getBrandListWithBlock:(void (^)(NSArray *brandList))block
{
    [[AppAPIClient sharedClient] getPath:@"/api/v1/categories"
                              parameters:nil
                                 success:^(AFHTTPRequestOperation *operation, id JSON) {
                                     block([JSONAnalyzer analyzeBrandListFromJSON:JSON]);
                                 }
                                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                     alert(error.description);
                                 }];
}

+ (void)getDocumentListWithBlock:(void (^)(NSArray *documentList))block
{
    [[AppAPIClient sharedClient] getPath:@"/api/v1/documents"
                              parameters:nil
                                 success:^(AFHTTPRequestOperation *operation, id JSON) {
                                     block([JSONAnalyzer analyzeDocumentListFromJSON:JSON]);
                                 }
                                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                     alert(error.description);
                                 }];
}

+ (NSString *)path4API:(APIName)name
{
    return @"";
}

+ (NSMutableDictionary *)argu4API:(APIName)name
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    switch (name) {
            
        case APIObtainCityList:
        {
            [params setValue:@"region_mini_list" forKey:@"opt"];
        }
            break;
            
        case APIObtainCityInfo:
        {
            [params setValue:@"get_weather_by_name" forKey:@"opt"];
        }
            break;
            
        default:
            break;
    }
    
    return params;
}

@end
