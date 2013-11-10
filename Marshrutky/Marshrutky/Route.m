//
//  Route.m
//  Marshrutky
//
//  Created by Artem Paliy on 11/10/13.
//  Copyright (c) 2013 Artem Paliy. All rights reserved.
//

#import "Route.h"

@implementation Route

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.id = [dictionary objectForKey:@"route_id"];
        self.title = [dictionary objectForKey:@"route_title"];
        self.description = [dictionary objectForKey:@"route_description"];
        self.price = [dictionary objectForKey:@"route_price"];
        self.path = [dictionary objectForKey:@"route_path"];
        self.ownerId = [dictionary objectForKey:@"owner_id"];
        self.isStarred = NO;
    }
    return self;
}

@end

