#import "LocationsViewController.h"
#import "MainViewController.h"

@interface LocationsViewController () {
    WeatherRepository *_repository;
    NSArray<Location *> *_dataSet;
}

@end

@implementation LocationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _repository = [WeatherRepository sharedInstance];
    _dataSet = [_repository getAllLocations];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataSet count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LocationTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil){
        cell = [[LocationTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell bind:_dataSet[(NSUInteger) indexPath.row]];

    return cell;
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MainViewController *controller = [segue destinationViewController];

    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Location *selectedLocation = _dataSet[(NSUInteger) indexPath.row];
    controller.latitude = @(selectedLocation.latitude);
    controller.longitude = @(selectedLocation.longitude);
}

- (void)requery {
    _dataSet = [_repository getAllLocations];
    [self.tableView reloadData];
}


@end
