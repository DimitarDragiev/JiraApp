//
//  Issue.m
//  JiraApp
//
//  Created by Slavena  on 9/20/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "Issue.h"

@implementation Issue
-(id)initWithJSON:(NSDictionary*) data{
    self = [super init];
    if(self){
        self.issueURL = [data objectForKey:@"self"];
        self.issueID = [data objectForKey:@"id"];
        self.issueName = [data objectForKey:@"name"];
        self.issueDescription = [data objectForKey:@"description"];
        self.issueSummary = [data objectForKey:@"summary"];
        self.assigneeName = [[data objectForKey:@"assignee"] objectForKey:@"displayName"];
        self.issueTypeName = [[[data objectForKey:@"fields"]objectForKey:@"issuetype"] objectForKey:@"name"];
        self.issuePriority = [[[data objectForKey:@"fields"] objectForKey:@"priority"] objectForKey:@"name"];
        self.issueStatus = [[[data objectForKey:@"fields"] objectForKey:@"status"] objectForKey:@"name"];
    }
    return self;
}
@end
