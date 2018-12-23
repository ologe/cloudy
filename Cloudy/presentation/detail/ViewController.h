#import <UIKit/UIKit.h>
#import "Location.h"
#import "Weather.h"
#import "WeatherRepository.h"
#import "ImageHelper.h"

@interface ViewController : UIViewController

@property(weak, nonatomic) IBOutlet UILabel *location;
@property(weak, nonatomic) IBOutlet UILabel *temperature;
@property(weak, nonatomic) IBOutlet UILabel *humidity;
@property(weak, nonatomic) IBOutlet UILabel *pressure;
@property(weak, nonatomic) IBOutlet UILabel *wind;
@property(weak, nonatomic) IBOutlet UILabel *summary;
@property(weak, nonatomic) IBOutlet UIImageView *image;


@end

