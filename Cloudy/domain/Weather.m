#import "Weather.h"
#import "Location.h"

@implementation Weather

- (instancetype)initWithLocation:(Location *)location
                     temperature:(double)temperature
                  temperatureMin:(double)temperatureMin
                  temperatureMax:(double)temperatureMax
                        pressure:(int)pressure
                        humidity:(int)humidity
                            wind:(double)wind
                         summary:(NSString *)summary
                            icon:(NSString *)icon {
    self = [super init];
    if (self) {
        _location = location;
        _temperature = temperature;
        _temperatureMin = temperatureMin;
        _temperatureMax = temperatureMax;
        _pressure = pressure;
        _humidity = humidity;
        _wind = wind;
        _summary = summary;
        _icon = icon;
    }

    return self;
}


- (instancetype)initFromBytes:(NSData *)data {
    self = [super init];
    if (self) {
        NSError *error;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error || ![jsonObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"NSJSONSerialization failed with error: %@", [error localizedDescription]);
            @throw error;
        }
//        location
        NSString *location = [jsonObject objectForKey:@"name"];
        id coord = [jsonObject objectForKey:@"coord"];
        double latitude = [[coord objectForKey:@"lat"] doubleValue];
        double longitude = [[coord objectForKey:@"lon"] doubleValue];
        _location = [[Location alloc] initWithLatitude:latitude longitude:longitude name:location];

        id idMain = [jsonObject objectForKey:@"main"];
        _temperature = [[idMain objectForKey:@"temp"] doubleValue];
        _temperatureMin = [[idMain objectForKey:@"temp_min"] doubleValue];
        _temperatureMax = [[idMain objectForKey:@"temp_max"] doubleValue];
        _pressure = [[idMain objectForKey:@"pressure"] intValue];
        _humidity = [[idMain objectForKey:@"humidity"] intValue];

        id idWind = [jsonObject objectForKey:@"wind"];
        _wind = [[idWind objectForKey:@"speed"] doubleValue];

        id idWeather = [jsonObject objectForKey:@"weather"];
        if ([idWeather isKindOfClass:[NSArray class]]) {
            id firstIdWeather = idWeather[0];
            _summary = [firstIdWeather objectForKey:@"main"];
            _icon = [firstIdWeather objectForKey:@"icon"];
        } else {
            _summary = [idWeather objectForKey:@"main"];
            _icon = [idWeather objectForKey:@"icon"];
        }

    }
    return self;
}


@end
