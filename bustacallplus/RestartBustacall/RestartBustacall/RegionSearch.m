//
//  RegionSearch.m
//  RestartBustacall
//
//  Created by JongMinKim on 2/12/17.
//  Copyright © 2017 JongMinKim. All rights reserved.
//

#import "RegionSearch.h"
#import "APIRequest.h"
#import "OAuthInfoManager.h"


@implementation RegionSearch


- (NSString*) httpRequestTesting: (NSString*) KeyWord{
    
  
    NSString *URL = [NSString
                     stringWithFormat:@"https://apis.skplanetx.com/tmap/pois"];
   
    NSMutableDictionary *parms = [[NSMutableDictionary alloc] init];
    [parms setObject:@"20" forKey:@"count"];
    [parms setObject:KeyWord forKey:@"searchKeyword"];
    [parms setObject:@"WGS84GEO" forKey:@"resCoordType"];
    [parms setObject:@"1" forKey:@"version"];
    RequestBundle *req = [[RequestBundle alloc] init];
    [req setUrl:URL];
    [req setParameters:parms];
    
    APIRequest *api = [[APIRequest alloc] init];
    [APIRequest setAppKey:@"9175cfb8-62e9-3ed9-b58b-e61c7016bc53"];
   
    NSError *error = nil;
    ResponseMessage *result = [api request:req error:&error];
    
    if ( error ) {
        //NSLog(@"Error : %@", [error localizedDescription]);
    } else {
        //NSLog(@"Result : %@ %@", [result statusCode], [result resultMessage]);
    }
    
    return result.resultMessage;
}


@end
