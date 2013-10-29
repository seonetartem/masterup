//
//  Vehicle.m
//  Marshrutky
//
//  Created by Artem Paliy on 10/29/13.
//  Copyright (c) 2013 Artem Paliy. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

+(Vehicle *) getVehicleWithName:(NSString *)name andPrice:(NSNumber *)price {
    Vehicle* result = [[Vehicle alloc] init];
    result.name = name;
    result.price = price;
    
    return result;
}
@end
