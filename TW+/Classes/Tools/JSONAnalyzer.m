//
//  JSONAnalyzer.m
//  AFNetworkDemo
//
//  Created by Dennis Yang on 13-5-22.
//  Copyright (c) 2013年 Dennis Yang. All rights reserved.
//

#import "JSONAnalyzer.h"
#import "Brand.h"
#import "Document.h"

@implementation JSONAnalyzer

+ (NSArray *)analyzeCityListFromJSON:(id)json
{
    NSMutableArray *cityList = [NSMutableArray arrayWithCapacity:0];
    
    if ([json isKindOfClass:[NSDictionary class]])
    {
        NSArray *listmap = [json valueForKeyPath:@"listmap"];
        if (listmap && [listmap isKindOfClass:[NSArray class]])
        {
            for (int i =0; i < [listmap count]; i++)
            {
                //NSDictionary *listmapItem = [listmap objectAtIndex:i];
                //...
            }
            
            return cityList;
        }
    }
    
    return cityList;
}

+ (NSArray *)analyzeBrandListFromJSON:(id)json
{
    NSMutableArray *brandList = [NSMutableArray arrayWithCapacity:0];
    
    if ([json isKindOfClass:[NSDictionary class]])
    {
        NSArray *data = [json valueForKeyPath:@"data"];
        if (data && [data isKindOfClass:[NSArray class]])
        {
            for (int i = 0; i < [data count]; i++)
            {
                NSDictionary *dataItem = [data objectAtIndex:i];
                
                Brand *b = [[Brand alloc] init];
                b.name = [dataItem valueForKey:@"name"];
                
                [brandList addObject:b];
            }
        }
    }
    
    return brandList;
}

+ (NSArray *)analyzeDocumentListFromJSON:(id)json
{
    NSMutableArray *documentList = [NSMutableArray arrayWithCapacity:0];
    
    if ([json isKindOfClass:[NSDictionary class]])
    {
        NSArray *data = [json valueForKeyPath:@"data"];
        if (data && [data isKindOfClass:[NSArray class]])
        {
            for (int i = 0; i < [data count]; i++)
            {
                NSDictionary *dataItem = [data objectAtIndex:i];
                
                Document *d = [[Document alloc] init];
                d.name = [dataItem valueForKey:@"name"];
                
                [documentList addObject:d];
            }
        }
    }
    
    return documentList;
}

@end
