#import "WeatherRemoteDataSource.h"
#import "HTTPResponse.h"
#import "Weather.h"
#import "Location.h"

@implementation WeatherRemoteDataSource

static NSString *baseUrl = @"http://api.openweathermap.org/data/2.5/weather?appid=2953623c4b8c6cb2dc55372b6513d01c&units=metric";

- (Weather *)getWeatherForLocation:(Location *)location {
    NSString *url = [[NSString alloc] initWithFormat:@"%@&lat=%f&lon=%f", baseUrl, location.latitude, location.longitude];
    HTTPResponse *response = [self syncHttpRequest:[NSURL URLWithString:url]];
    Weather *weather = [[Weather alloc] initFromBytes:response.data];
    return weather;
}

- (HTTPResponse *)syncHttpRequest:(NSURL *)url {
    __block NSData *_data;
    __block NSURLResponse *_response;
    __block NSError *_error;


    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        _data = data;
        _response = response;
        _error = error;
        NSLog(@"%@", [error localizedDescription]);
        dispatch_semaphore_signal(semaphore);
    }] resume];

    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

    HTTPResponse *response = [[HTTPResponse alloc] initWithData:_data response:_response error:_error];
    NSError *error = response.error;
    NSLog(@"%@ responded with: %@", url.absoluteURL, [NSJSONSerialization JSONObjectWithData:response.data options:0 error:&error]);
    
    return response;
}


@end
