#import "WeatherLocalDataSource.h"
#import "WeatherEntity.h"
#import "Location.h"
#import "Weather.h"


@implementation WeatherLocalDataSource

static NSString *cacheTime = @"1 hours";
static NSDateFormatter * _dateFormatter = [[NSDateFormatter alloc] init];

+ (void) initialize{
    if (self == [NSObject class]){
        [_dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
}

- (Weather *)getWeatherForLocation:(Location *)location {
    SRKQuery * query = [[WeatherEntity query] whereWithFormat:@"latitude = ? AND longitude = ? "
                            withParameters:@[@(location.latitude), @(location.longitude)]];
    query = [query whereWithFormat:@"lastUpdate BETWEEN date('now', '-?') and date('now')" withParameters:@[cacheTime]];
    return  [[query fetch] firstObject];
}

- (BOOL)cacheWeather:(Weather *)weather {
    return [[self mapToEntity:weather] commit];
}

- (WeatherEntity *)mapToEntity:(Weather *)weather{
    WeatherEntity *entity = [[WeatherEntity alloc] init];
    entity.latitude = weather.location.latitude;
    entity.longitude = weather.location.longitude;
    entity.temperature = weather.temperature;
    entity.humidity = weather.humidity;
    entity.pressure = weather.pressure;
    entity.wind = weather.wind;

    NSDate * now = [[NSDate alloc] initWithTimeIntervalSince1970:[[NSDate date] timeIntervalSince1970]];
    entity.lastUpdate = [_dateFormatter stringFromDate:now];

    return entity;
}


@end