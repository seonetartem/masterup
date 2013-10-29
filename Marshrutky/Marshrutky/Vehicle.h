//
//  Vehicle.h
//  Marshrutky
//
//  Created by Artem Paliy on 10/29/13.
//  Copyright (c) 2013 Artem Paliy. All rights reserved.
//

#import "Transport.h"

@interface Vehicle : Transport
    @property (strong, nonatomic) NSNumber * price;	

- (Vehicle *) getVehicleName:(NSString *)name andPrice:(NSNumber *)price;
@end
