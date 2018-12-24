//
//  LocationTableCell.m
//  Cloudy
//
//  Created by Eugeniu Olog on 2018-12-24.
//  Copyright © 2018 Eugeniu Olog. All rights reserved.
//

#import "LocationTableCell.h"

@implementation LocationTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bind:(Location *)location {
    self.locationName.text = location.name;
}


@end
