//
//  Route.h
//  Marshrutky
//
//  Created by Artem Paliy on 11/10/13.
//  Copyright (c) 2013 Artem Paliy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject

@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *ownerId;
@property (nonatomic) BOOL isStarred;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
