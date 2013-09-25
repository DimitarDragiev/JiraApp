//
//  JiraAppRequestCentre.h
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPClient.h>


@interface JiraRestClientAPI : AFHTTPClient

+ (JiraRestClientAPI *)sharedClient;
-(void)getProjectsWithSuccessBlock: (void(^)(id project)) success andFailureBlock:(void (^)(NSError *error)) fail;
-(void)getProjectDetailsWithKey:(NSString*)key andSuccessBlock: (void(^)(id project)) success andFailureBlock:(void (^)(NSError *error)) fail;
-(void)setAuthCredentials:(NSString*)username password:(NSString*)password;

@end

