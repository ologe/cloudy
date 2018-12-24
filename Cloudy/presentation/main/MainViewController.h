#import <UIKit/UIKit.h>
#import "Location.h"
#import "Weather.h"
#import "WeatherRepository.h"
#import "ImageHelper.h"
#import <SWRevealViewController.h>
#import "LocationsViewController.h"

@interface MainViewController : UIViewController

@property NSNumber *latitude;
@property NSNumber *longitude;

@property(weak, nonatomic) IBOutlet UILabel *location;
@property(weak, nonatomic) IBOutlet UILabel *temperature;
@property(weak, nonatomic) IBOutlet UILabel *humidity;
@property(weak, nonatomic) IBOutlet UILabel *pressure;
@property(weak, nonatomic) IBOutlet UILabel *wind;
@property(weak, nonatomic) IBOutlet UILabel *summary;
@property(weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *temperatureMin;
@property (weak, nonatomic) IBOutlet UILabel *temperatureMax;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *drawer;
@property (weak, nonatomic) IBOutlet UIButton *add;


@end

