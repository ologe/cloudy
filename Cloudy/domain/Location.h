#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Location : NSObject

@property(readonly) double latitude;
@property(readonly) double longitude;
@property(readonly) NSString *name;

- (instancetype)initWithLatitude:(double)latitude
                       longitude:(double)longitude
                            name:(NSString *)name;

- (instancetype)initWithLatitude:(double)latitude longitude:(double)longitude;


@end

NS_ASSUME_NONNULL_END
