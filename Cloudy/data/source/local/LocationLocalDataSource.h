#import <Foundation/Foundation.h>
#import "LocationDataSource.h"


@interface LocationLocalDataSource : NSObject

- (NSArray<Location *> *)getAllLocations;

- (BOOL)addLocation:(Location *)location;

- (BOOL)deleteLocation:(Location *)location;

- (BOOL)deleteForLatitude:(double)latitude
                longitude:(double)longitude;

@end