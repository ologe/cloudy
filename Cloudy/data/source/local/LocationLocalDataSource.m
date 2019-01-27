#import "LocationLocalDataSource.h"
#import "LocationEntity.h"
#import "Location.h"


@implementation LocationLocalDataSource

- (NSArray<Location *> *)getAllLocations {
    return [[LocationEntity query] fetch];
}

- (BOOL)addLocation:(Location *)location {
    return [[self mapToEntity:location] commit];
}

- (BOOL)deleteLocation:(Location *)location {
    return [[self mapToEntity:location] remove];
}

- (BOOL)deleteForLatitude:(double)latitude longitude:(double)longitude {
    SRKQuery * query = [LocationEntity query];
    query = [query whereWithFormat:@"latitude = ? AND longitude = ?" withParameters:@[@(latitude), @(longitude)]];
    return [[query fetch] remove];
}


- (LocationEntity *)mapToEntity:(Location *)location {
    LocationEntity *entity = [[LocationEntity alloc] init];
    entity.name = location.name;
    entity.latitude = location.latitude;
    entity.longitude = location.longitude;
    return entity;
}


@end