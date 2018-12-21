#import "Weather.h"
#import "Location.h"

@implementation Weather

- (instancetype)initWithLocation:(Location *)location
                     temperature:(double)temperature
                        pressure:(int)pressure
                        humidity:(int)humidity
                            wind:(double)wind
                         summary:(double)summary {
    self = [super init];
    if (self) {
        _location = location;
        _temperature = temperature;
        _pressure = pressure;
        _humidity = humidity;
        _wind = wind;
        _summary = summary;
    }

    return self;
}


@end
