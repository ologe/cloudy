#import <Foundation/Foundation.h>
#import <SharkORM/SharkORM.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherEntity : SRKObject

@property double latitude;
@property double longitude;
@property double temperature;
@property double temperatureMin;
@property double temperatureMax;
@property int pressure;
@property int humidity;
@property double wind;
@property NSString *summary;
@property NSString *icon;
@property NSString *lastUpdate;

@end

NS_ASSUME_NONNULL_END
