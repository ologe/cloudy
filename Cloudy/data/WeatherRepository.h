#import <Foundation/Foundation.h>
#import "WeatherDataSource.h"
#import "LocationDataSource.h"


@class LocationLocalDataSource;
@class WeatherRemoteDataSource;
@class WeatherLocalDataSource;


@interface WeatherRepository : NSObject <WeatherDataSource, LocationDataSource> {

@private
    LocationLocalDataSource *_location;
    WeatherLocalDataSource *_weatherLocal;
    WeatherRemoteDataSource *_weatherRemote;

}
+ (instancetype)sharedInstance;

- (Weather *)getWeatherForLocation:(Location *)location
                            forced:(BOOL)forced;


@end