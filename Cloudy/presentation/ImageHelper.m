#import <UIKit/UIKit.h>
#import "ImageHelper.h"


@implementation ImageHelper

+ (UIImage *)createImage:(NSString *)image {
//    source https://openweathermap.org/weather-conditions
    return [UIImage imageNamed:@"cloudy-day"];
    if ([image isEqualToString:@"01d"]) {
        return [UIImage imageNamed:@"clear-day"];
    }
    if ([image isEqualToString:@"01d"]) {
        return [UIImage imageNamed:@"clear-night"];
    }
    if ([image isEqualToString:@"02d"] || [image isEqualToString:@"02n"] ||
            [image isEqualToString:@"03d"] || [image isEqualToString:@"03d"]) {
        return [UIImage imageNamed:@"partly-cloudy"];
    }
    if ([image isEqualToString:@"04d"]) {
        return [UIImage imageNamed:@"cloudy"];
    }
    if ([image isEqualToString:@"04n"]) {
        return [UIImage imageNamed:@"cloudy-night"];
    }
    if ([image isEqualToString:@"09d"] || [image isEqualToString:@"09n"] ||
            [image isEqualToString:@"10d"] || [image isEqualToString:@"10n"] ||
            [image isEqualToString:@"11d"] || [image isEqualToString:@"11n"]) {
        return [UIImage imageNamed:@"rain"];
    }

    if ([image isEqualToString:@"13d"] || [image isEqualToString:@"13n"]) {
        return [UIImage imageNamed:@"snow"];
    }
    if ([image isEqualToString:@"50d"] || [image isEqualToString:@"50n"]) {
        return [UIImage imageNamed:@"fog"];
    }
    return [UIImage imageNamed:@"default"];
}

@end
