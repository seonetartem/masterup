//
//  RoutCell.m
//  Marshrutky
//
//  Created by Artem Paliy on 10/30/13.
//  Copyright (c) 2013 Artem Paliy. All rights reserved.
//

#import "RoutCell.h"

@implementation RoutCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
