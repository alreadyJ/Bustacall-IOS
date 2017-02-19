//
//  Poi.m
//  RestartBustacall
//
//  Created by JongMinKim on 2/16/17.
//  Copyright © 2017 JongMinKim. All rights reserved.
//

#import "Poi.h"

@implementation Poi
- (instancetype)init
{
    self = [super init];
    if (self) {
        _id = 0;
        name = @"";
        telNo = @"";
        frontLat = 0.0;
        frontLon = 0.0;
        noorLat = 0.0;
        noorLon = 0.0;
        upperAddrName= @"";
        middleAddrName= @"";
        lowerAddrName= @"";
        detailAddrName= @"";
        firstNo= @"";
        secondNo= @"";
        roadName= @"";
        firstBuildNo= @"";
        secondBuildNo= @"";
        radius = 0;
        bizName = @"";
        upperBizName = @"";
        middleBizName = @"";
        lowerBizName = @"";
        detailBizName = @"";
        rpFlag = 0;
        parkFlag = 0;
        detailInfoFlag = 0;
        desc = @"";

    }
    return self;
}

@end
