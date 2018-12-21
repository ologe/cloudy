//
//  Location.m
//  Cloudy
//
//  Created by Eugeniu Olog on 2018-12-21.
//  Copyright © 2018 Eugeniu Olog. All rights reserved.
//

#import "Location.h"
#import "Weather.h"

@implementation Location

- (instancetype)initWithLatitude:(double)latitude
                       longitude:(double)longitude
                            name:(NSString *)name {
    self = [super init];
    if (self) {
        _latitude = latitude;
        _longitude = longitude;
        _name = name;
    }

    return self;
}


@end
