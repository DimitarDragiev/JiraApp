//
//  ProjectManager.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "ProjectManager.h"
#import "Project.h"

@implementation ProjectManager
@synthesize projects;

+ (ProjectManager *)sharedManager {
    static ProjectManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[ProjectManager alloc] init];
        if(_sharedManager){
            _sharedManager.projects = [NSMutableArray new];
        }
    });
    return _sharedManager;
}
-(void)setUpWithServerResponse:(NSArray *)dataArray{
    [projects removeAllObjects];
    for (NSDictionary* p in dataArray) {
        Project *project = [[Project alloc]initWithJSON:p];
        [projects addObject:project];
    }
}

@end
