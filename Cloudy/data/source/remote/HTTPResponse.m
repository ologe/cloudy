#import "HTTPResponse.h"


@implementation HTTPResponse

- (instancetype)initWithData:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error {
    self = [super init];
    if (self) {
        _data = data;
        _response = response;
        _error = error;
    }

    return self;
}


@end