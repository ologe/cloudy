#import <Foundation/Foundation.h>

@class Weather;
@class Location;

@protocol WeatherDataSource <NSObject>

- (Weather *)getWeatherForLocation:(Location *)location;


@end