#import <Foundation/Foundation.h>

@class Location;

NS_ASSUME_NONNULL_BEGIN

@interface Weather : NSObject

@property(readonly) Location *location;
@property(readonly) double temperature;
@property(readonly) int pressure;
@property(readonly) int humidity;
@property(readonly) double wind;
@property(readonly) NSString *summary;
@property(readonly) NSString *icon;

- (instancetype)initWithLocation:(Location *)location
                     temperature:(double)temperature
                        pressure:(int)pressure
                        humidity:(int)humidity
                            wind:(double)wind
                         summary:(NSString *)summary
                            icon:(NSString *) icon;

- (instancetype)initFromBytes:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
