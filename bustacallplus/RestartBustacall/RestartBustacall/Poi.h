//
//  Poi.h
//  RestartBustacall
//
//  Created by JongMinKim on 2/16/17.
//  Copyright © 2017 JongMinKim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Poi : NSObject {
    int _id;
    NSString *name;
    NSString *telNo;
    double frontLat;
    double frontLon;
    double noorLat;
    double noorLon;
    NSString *upperAddrName;
    NSString *middleAddrName;
    NSString *lowerAddrName;
    NSString *detailAddrName;
    NSString *firstNo;
    NSString *secondNo;
    NSString *roadName;
    NSString *firstBuildNo;
    NSString *secondBuildNo;
    int radius;
    NSString *bizName;
    NSString *upperBizName;
    NSString *middleBizName;
    NSString *lowerBizName;
    NSString *detailBizName;
    int rpFlag;
    int parkFlag;
    int detailInfoFlag;
    NSString *desc;
}

-(instancetype)init;

@end
