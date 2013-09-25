//
//  Project.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "Project.h"
#import "Issue.h"

@implementation Project

-(id)initWithJSON:(NSDictionary*) data{
    self = [super init];
    if(self){
        self.projectID = [data objectForKey:@"id"];
        self.key = [data objectForKey:@"key"];
        self.name = [data objectForKey:@"name"];
        self.url = [data objectForKey:@"self"];
    
    
        if([data objectForKey:@"lead"]){
            self.lead = [[User alloc] initWithJSON:[data objectForKey:@"lead"]];
        }
        if([data objectForKey:@"issueTypes"]){
            self.issues = [NSMutableArray new];
            for(Issue *issue in [data objectForKey:@"issueTypes"]){
                [self.issues addObject:issue];
            }
        }
    }
    return self;
}


@end
