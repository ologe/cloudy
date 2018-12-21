#import <Foundation/Foundation.h>

@class Location;

NS_ASSUME_NONNULL_BEGIN

@interface Weather : NSObject

@property(readonly) Location *location;
@property(readonly) double temperature;
@property(readonly) int pressure;
@property(readonly) int humidity;
@property(readonly) double wind;
@property(readonly) double summary;

- (instancetype)initWithLocation:(Location *)location
                     temperature:(double)temperature
                        pressure:(int)pressure
                        humidity:(int)humidity
                            wind:(double)wind
                         summary:(double)summary;


@end

NS_ASSUME_NONNULL_END
