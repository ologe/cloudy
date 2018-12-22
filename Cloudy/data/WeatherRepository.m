#import "WeatherRepository.h"
#import "WeatherLocalDataSource.h"
#import "WeatherRemoteDataSource.h"
#import "LocationLocalDataSource.h"


@implementation WeatherRepository

- (instancetype)init {
    self = [super init];
    if (self) {
        _location = [[LocationLocalDataSource alloc] init];
        _weatherLocal = [[WeatherLocalDataSource alloc] init];
        _weatherRemote = [[WeatherRemoteDataSource alloc] init];
    }

    return self;
}

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (NSArray<Location *> *)getAllLocations {
    return [_location getAllLocations];
}

- (BOOL)addLocation:(Location *)location {
    return [_location addLocation:location];
}

- (BOOL)deleteLocation:(Location *)location {
    return [_location deleteLocation:location];
}

- (BOOL)deleteForLatitude:(double)latitude longitude:(double)longitude {
    return [_location deleteForLatitude:latitude longitude:longitude];
}

- (Weather *)getWeatherForLocation:(Location *)location forced:(BOOL)forced {
    Weather *weather = [_weatherLocal getWeatherForLocation:location];
    if (weather == nil || forced) {
        weather = [_weatherRemote getWeatherForLocation:location];
        BOOL added = [_weatherLocal cacheWeather:weather];
    }

    return weather;
}

- (Weather *)getWeatherForLocation:(Location *)location {
    return [self getWeatherForLocation:location forced:NO];
}


@end
