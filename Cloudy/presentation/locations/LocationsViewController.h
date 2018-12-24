#import <UIKit/UIKit.h>
#import "WeatherRepository.h"
#import "Location.h"
#import <SWRevealViewController.h>
#import "LocationTableCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocationsViewController : UITableViewController

-(void) requery;

@end

NS_ASSUME_NONNULL_END
