//
//  JiraAppRequestCentre.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "JiraRestClientAPI.h"
#import "Project.h"
#import "ProjectManager.h"
#import <AFNetworking/AFJSONRequestOperation.h>

static NSString *const JiraAppRequestCentreURLString = @"https://jira01.isdc.eu/rest/api/2/";

@implementation JiraRestClientAPI

+ (JiraRestClientAPI *)sharedClient {
    static JiraRestClientAPI *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[JiraRestClientAPI alloc] initWithBaseURL:[NSURL URLWithString:JiraAppRequestCentreURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[JiraHTTPRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    [self setDefaultHeader:@"Content-type" value:@"application/json"];
    return self;
}

-(void)setAuthCredentials:(NSString*)username password:(NSString*)password{
    [[self.class sharedClient] setAuthorizationHeaderWithUsername:username password:password];
}

-(void)getProjectsWithSuccessBlock: (void(^)(id project)) success andFailureBlock:(void (^)(NSError *error)) fail{
    [[self.class sharedClient] getPath:@"project" parameters:nil success:^(AFHTTPRequestOperation *operation, NSArray* responseObject) {
        if(success){
            ProjectManager *pm =  [ProjectManager sharedManager];
            [pm setUpWithServerResponse:responseObject];
            success(pm.projects);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
        NSLog(@"%ld",(long)operation.response.statusCode);
    }];
};
-(void)showErrorForAccessDenied:(int)statuscode{
    if(statuscode == 403){
        [[[UIAlertView alloc]initWithTitle:@""
                                   message:@"Incorrect username or password"
                                   delegate:nil
                                   cancelButtonTitle:@"OK"
                                   otherButtonTitles:nil] show];
    }
}
-(void)getProjectDetailsWithKey:(NSString*)key andSuccessBlock: (void(^)(id project)) success andFailureBlock:(void (^)(NSError *error)) fail{
    NSString *path = [NSString stringWithFormat:@"project/%@", key];

    [[self.class sharedClient] getPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary* responseObject) {
        if(success){
            NSLog(@"%@", responseObject);
            Project *project = [[Project alloc] initWithJSON:responseObject];
            success(project);
            /*NSLog(@"%@", [responseObject objectForKey:@"description"]);
             NSLog(@"%@", [[responseObject objectForKey:@"lead"] objectForKey:@"displayName"]);
             for(id issue in [responseObject objectForKey:@"issueTypes"])
             NSLog(@"%@ - %@", [issue objectForKey: @"name"], [issue objectForKey:@"description"]);*/
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
    }];
}

@end
