//
//  RoutCell.h
//  Marshrutky
//
//  Created by Artem Paliy on 10/30/13.
//  Copyright (c) 2013 Artem Paliy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoutCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UILabel *routName;
@property (weak, nonatomic) IBOutlet UILabel *routPrice;

@end
