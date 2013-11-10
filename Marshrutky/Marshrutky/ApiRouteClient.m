//
//  ApiRoutClient.m
//  Marshrutky
//
//  Created by Artem Paliy on 11/10/13.
//  Copyright (c) 2013 Artem Paliy. All rights reserved.
//

#import "ApiRouteClient.h"


static NSString *gApiBaseUrl = @"http://itomy.ch/";

@implementation ApiRouteClient

+ (id)sharedInstance
{
    static ApiRouteClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[ApiRouteClient alloc] initWithBaseURL:[NSURL URLWithString:gApiBaseUrl]];
    });
    
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        [self registerHTTPOperationClass:[AFHTTPRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    } else {
        self = nil;
    }
    
    return self;
}

- (void)updateRoutesList:(void (^)(NSArray *routes))successBlock failure:(void (^)(NSError *error))failureBlock;
{
    
    [self getPath:@"routes.php"
       parameters:nil
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              successBlock((NSArray *)responseObject);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              failureBlock(error);
          }
     ];
    
}

@end
