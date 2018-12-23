#import "ViewController.h"

@interface ViewController () {
@private
    WeatherRepository *_repository;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _repository = [WeatherRepository sharedInstance];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        Location *location = [[Location alloc] initWithLatitude:37.39 longitude:-122.09];
        Weather *weather = [self->_repository getWeatherForLocation:location];

        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateUI:weather];
        });
    });
}

- (void)updateUI:(Weather *)weather {
    NSString *percentage = @"%";
    self.location.text = [weather.location.name uppercaseString];
    self.temperature.text = [[NSString alloc] initWithFormat:@"%.1f", weather.temperature];
    self.humidity.text = [[NSString alloc] initWithFormat:@"%d%@", weather.humidity, percentage];
    self.pressure.text = [[NSString alloc] initWithFormat:@"%dhPa", weather.pressure];
    self.wind.text = [[NSString alloc] initWithFormat:@"%.1fm/s", weather.wind];
    self.summary.text = [weather.summary uppercaseString];
    self.image.image = [ImageHelper createImage:weather.icon];
}


@end
