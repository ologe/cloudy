#import "WeatherLocalDataSource.h"
#import "WeatherEntity.h"
#import "Location.h"
#import "Weather.h"

static NSString *cacheTime = @"1 hours";
static NSDateFormatter *_dateFormatter = nil;

@implementation WeatherLocalDataSource

+ (void)initialize {
    if (self == [NSObject class]) {
        if (!_dateFormatter) {
            _dateFormatter = [[NSDateFormatter alloc] init];
            [_dateFormatter setDateFormat:@"yyyy-MM-dd"];
        }
    }
}

- (Weather *)getWeatherForLocation:(Location *)location {
    NSString *sql = [[NSString alloc] initWithFormat:@"SELECT w.*, l.name FROM weatherentity w JOIN locationentity l ON "
                                                     " (w.latitude = l.latitude AND w.longitude = l.longitude) "
                                                     " WHERE latitude = %f AND longitude = %f "
                                                     " AND lastUpdate BETWEEN date('now', '-%@') and date('now')",
                                                     location.latitude, location.longitude, cacheTime];
    // TODO table name 'weather_entity' is incorrect
    SRKRawResults *rawResults = [SharkORM rawQuery:sql];
//    SRKRawResults *rawResults = [SharkORM rawQuery:@"SELECT * from weatherentity"];
    if ([rawResults.rawResults count] == 0) {
        return nil;
    }

    return [self mapToDomain:rawResults atIndex:0];
}

- (BOOL)cacheWeather:(Weather *)weather {
    return [[self mapToEntity:weather] commit];
}

- (WeatherEntity *)mapToEntity:(Weather *)weather {
    WeatherEntity *entity = [[WeatherEntity alloc] init];
    entity.latitude = weather.location.latitude;
    entity.longitude = weather.location.longitude;
    entity.temperature = weather.temperature;
    entity.humidity = weather.humidity;
    entity.pressure = weather.pressure;
    entity.wind = weather.wind;

    NSDate *now = [[NSDate alloc] initWithTimeIntervalSince1970:[[NSDate date] timeIntervalSince1970]];
    entity.lastUpdate = [_dateFormatter stringFromDate:now];

    return entity;
}

- (Weather *)mapToDomain:(SRKRawResults *)result atIndex:(int)index {

    Location *location = [[Location alloc] initWithLatitude:[[result valueForColumn:@"latitude" atRow:index] doubleValue]
                                                  longitude:[[result valueForColumn:@"longitude" atRow:index] doubleValue]
                                                       name:[[result valueForColumn:@"name" atRow:index] string]];

    return [[Weather alloc] initWithLocation:location
                                 temperature:[[result valueForColumn:@"temperature" atRow:index] doubleValue]
                                 temperatureMin:[[result valueForColumn:@"temperatureMin" atRow:index] doubleValue]
                                 temperatureMax:[[result valueForColumn:@"temperatureMax" atRow:index] doubleValue]
                                    pressure:[[result valueForColumn:@"pressure" atRow:index] intValue]
                                    humidity:[[result valueForColumn:@"humidity" atRow:index] intValue]
                                        wind:[[result valueForColumn:@"wind" atRow:index] doubleValue]
                                     summary:[[result valueForColumn:@"summary" atRow:index] string]
                                        icon:[[result valueForColumn:@"icon" atRow:index] string]];
}


@end
