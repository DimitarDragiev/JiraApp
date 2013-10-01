//
//  ProjectManager.h
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectManager : NSObject

@property (nonatomic,strong) NSMutableArray * projects;
+ (ProjectManager *)sharedManager;
-(void)setUpWithServerResponse:(NSArray*) dataArray;

@end
