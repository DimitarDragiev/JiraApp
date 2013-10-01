//
//  JiraAppRequestCentre.h
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPClient.h>
#import "JiraHTTPRequestOperation.h"


@interface JiraRestClientAPI : AFHTTPClient

+ (JiraRestClientAPI *)sharedClient;
-(void)getProjectsWithSuccessBlock: (void(^)(id project)) success andFailureBlock:(void (^)(NSError *error)) fail;
-(void)getProjectDetailsWithKey:(NSString*)key andSuccessBlock: (void(^)(id project)) success andFailureBlock:(void (^)(NSError *error)) fail;
-(void)getIssueDetailsWithKey:(NSString*)key andSuccessBlock: (void(^)(id data)) success andFailureBlock:(void (^)(NSError *error)) fail;
-(void)getDashboardWithSuccessBlock: (void(^)(id data)) success andFailureBlock:(void (^)(NSError *error)) fail;
-(void)setAuthCredentials:(NSString*)username password:(NSString*)password;
-(void)showErrorForAccessDenied:(int)statuscode;

@end

