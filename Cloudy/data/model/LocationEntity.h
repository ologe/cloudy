#import <Foundation/Foundation.h>
#import <SharkORM/SharkORM.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocationEntity : SRKObject

@property double latitude;
@property double longitude;
@property NSString *name;

@end

NS_ASSUME_NONNULL_END
