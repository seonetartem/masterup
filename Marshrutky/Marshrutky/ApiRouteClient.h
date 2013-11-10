//
//  ApiRoutClient.h
//  Marshrutky
//
//  Created by Artem Paliy on 11/10/13.
//  Copyright (c) 2013 Artem Paliy. All rights reserved.
//

#import "AFNetworking.h"
#import "AFHTTPClient.h"


@protocol ApiRouteClientDelegate;

@interface ApiRouteClient : AFHTTPClient

    @property (weak) id<ApiRouteClientDelegate> delegate;

    + (id)sharedInstance;

    - (id)initWithBaseURL:(NSURL *)url;
    - (void)updateRoutesList:(void (^)(NSArray* routes))successBlock  failure:(void (^)(NSError *error))failureBlock;

@end


@protocol ApiRouteClientDelegate <NSObject>
-(void)ApiRouteClient:(ApiRouteClient *)client didFailWithError:(NSError *)error;

@optional
-(void)ApiRouteClient:(ApiRouteClient *)client didUpdateRoutes:(NSArray*)routes;
@end