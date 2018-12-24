#import <UIKit/UIKit.h>
#import "ImageHelper.h"


@implementation ImageHelper

+ (UIImage *)createImage:(NSString *)image {
//    source https://openweathermap.org/weather-conditions
    if ([image isEqualToString:@"01d"]) {
        return [UIImage imageNamed:@"sun"];
    }
    if ([image isEqualToString:@"01n"]) {
        return [UIImage imageNamed:@"night"];
    }
    if ([image isEqualToString:@"02d"] ||
        [image isEqualToString:@"03d"] ||
        [image isEqualToString:@"04d"]) {
        return [UIImage imageNamed:@"cloudy-day"];
    }
    if ([image isEqualToString:@"02n"] ||
        [image isEqualToString:@"03n"] ||
        [image isEqualToString:@"04n"]) {
        return [UIImage imageNamed:@"cloudy-night"];
    }
    if ([image isEqualToString:@"09d"] || [image isEqualToString:@"10d"]) {
        return [UIImage imageNamed:@"rain-day"];
    }
    if ([image isEqualToString:@"09n"] || [image isEqualToString:@"10n"]) {
        return [UIImage imageNamed:@"rain-night"];
    }

    if ([image isEqualToString:@"11d"]) {
        return [UIImage imageNamed:@"storm-day"];
    }
    if ([image isEqualToString:@"11n"]) {
        return [UIImage imageNamed:@"storm-night"];
    }
    
    if ([image isEqualToString:@"13d"]) {
        return [UIImage imageNamed:@"snow-day"];
    }
    if ([image isEqualToString:@"13n"]) {
        return [UIImage imageNamed:@"snow-night"];
    }
    if ([image isEqualToString:@"50d"] || [image isEqualToString:@"50n"]) {
        return [UIImage imageNamed:@"fog"];
    }
    return [UIImage imageNamed:@"sun"];
}

@end
