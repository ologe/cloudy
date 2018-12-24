#import "MainViewController.h"

@interface MainViewController () {
@private
    WeatherRepository *_repository;
    UIRefreshControl *_refresher;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _repository = [WeatherRepository sharedInstance];
    if (self.latitude == nil){
        NSArray * locations = [_repository getAllLocations];
        if ([locations count] > 0){
            Location *defaultLocation = locations[0];
            self.latitude = @(defaultLocation.latitude);
            self.longitude = @(defaultLocation.longitude);
        }
    }

    
    [self.drawer addTarget:self.revealViewController
                     action:@selector(revealToggle:)
           forControlEvents:(UIControlEventTouchUpInside)];
     [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [self.add addTarget:self
                 action:@selector(showAddCoordinatesPopup)
       forControlEvents:(UIControlEventTouchUpInside)];
    
    [self setupSwipeToRefresh];
    [self fetchData:false];
}

- (void) setupSwipeToRefresh{
    _refresher = [[UIRefreshControl alloc] init];
    [_refresher addTarget:self
                   action:@selector(refreshView:)
         forControlEvents:UIControlEventValueChanged];
    [self.scrollView setRefreshControl:_refresher];
}

-(void)refreshView:(UIRefreshControl *)refresh {
    [self fetchData:true];
}

- (void) fetchData:(BOOL) forced{
    if (self.latitude != nil) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            Location *location = [[Location alloc] initWithLatitude:[self.latitude doubleValue] longitude:[self.longitude doubleValue]];
            Weather *weather = [self->_repository getWeatherForLocation:location forced:forced];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateUI:weather];
                if (forced) {
                    [self->_refresher endRefreshing];
                }
            });
        });
    } else {
        NSLog(@"invalid coordinates");
    }

}

- (void)updateUI:(Weather *)weather {
    NSString *percentage = @"%";
    self.location.text = [weather.location.name uppercaseString];
    self.temperature.text = [[NSString alloc] initWithFormat:@"%.1f", weather.temperature];
    self.temperatureMin.text = [[NSString alloc] initWithFormat:@"%.1f°", weather.temperatureMin];
    self.temperatureMax.text = [[NSString alloc] initWithFormat:@"%.1f°", weather.temperatureMax];
    self.humidity.text = [[NSString alloc] initWithFormat:@"%d%@", weather.humidity, percentage];
    self.pressure.text = [[NSString alloc] initWithFormat:@"%dhPa", weather.pressure];
    self.wind.text = [[NSString alloc] initWithFormat:@"%.1fm/s", weather.wind];
    self.summary.text = [weather.summary uppercaseString];
    self.image.image = [ImageHelper createImage:weather.icon];
}

-(void) showAddCoordinatesPopup{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"New location"
                                                                   message:nil
                                                            preferredStyle:(UIAlertControllerStyleAlert)];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleDestructive) handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Save" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [self saveLocationname:alert.textFields[0].text
                  withLatitude:alert.textFields[1].text
                  andLongitude:alert.textFields[2].text];
    }]];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Name";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Latitude";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Longitude";
    }];
    
    [self presentViewController:alert animated:YES completion:^{}];
}

-(void) saveLocationname:(NSString*)name withLatitude:(NSString *)latitude andLongitude:(NSString*)longitude{
    Location *location = [[Location alloc] initWithLatitude:latitude.doubleValue longitude:longitude.doubleValue name:name];
    [_repository addLocation:location];

    LocationsViewController *controller = (LocationsViewController*) self.revealViewController.rearViewController;
    [controller requery];
}




@end
