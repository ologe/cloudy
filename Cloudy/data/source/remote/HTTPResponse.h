#import <Foundation/Foundation.h>


@interface HTTPResponse : NSObject

@property(readonly) NSData *data;
@property(readonly) NSURLResponse *response;
@property(readonly) NSError *error;

- (instancetype)initWithData:(NSData *)data
                    response:(NSURLResponse *)response
                       error:(NSError *)error;


@end