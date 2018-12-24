#import <UIKit/UIKit.h>
#import "Location.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocationTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *locationName;

- (void) bind:(Location*) location;

@end

NS_ASSUME_NONNULL_END
