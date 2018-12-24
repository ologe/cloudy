#import <Foundation/Foundation.h>

@class Location;

@protocol LocationDataSource <NSObject>

- (NSArray<Location *> *)getAllLocations;

- (BOOL)addLocation:(Location *)location;

- (BOOL)deleteLocation:(Location *)location;

- (BOOL)deleteForLatitude:(double)latitude
                longitude:(double)longitude;

@end