#import <Foundation/Foundation.h>
#import "WeatherDataSource.h"


@interface WeatherLocalDataSource : NSObject <WeatherDataSource>

- (BOOL)cacheWeather:(Weather *)weather;

@end