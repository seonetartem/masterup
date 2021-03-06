//
//  RoutesViewController.h
//  Marshrutky
//
//  Created by Artem Paliy on 10/30/13.
//  Copyright (c) 2013 Artem Paliy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiRouteClient.h"
#import "Route.h"
#import "RoutCell.h"

@interface RoutesViewController : UITableViewController <ApiRouteClientDelegate>
    @property int count;
@end
