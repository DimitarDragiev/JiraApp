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
/*
 {
     expand = "editmeta,renderedFields,transitions,changelog,operations";
     fields =         {
         assignee =             {
             active = 1;
             avatarUrls =                 {
                 16x16 = "https://jira01.isdc.eu/secure/useravatar?size=small&avatarId=10282";
                 48x48 = "https://jira01.isdc.eu/secure/useravatar?avatarId=10282";
             };
             displayName = "Jory Nagel";
             emailAddress = "Jory.Nagel@isdc.eu";
             name = "Jory.Nagel";
             self = "https://jira01.isdc.eu/rest/api/2/user?username=Jory.Nagel";
         };
         summary = "User checks his profile settings";
         };
     id = 81505;
     key = "SO-19";
     self = "https://jira01.isdc.eu/rest/api/2/issue/81505";
 }
 */
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
        
        if([data objectForKey:@"issues"]){
            self.issues = [NSMutableArray new];
            for(id issue in [data objectForKey:@"issues"]){
                Issue *newIssue = [Issue new];
                newIssue.issueID = [issue objectForKey:@"id"];
                newIssue.issueSummary = [[issue objectForKey:@"fields"] objectForKey:@"summary"];
                if([issue objectForKey:@"fields"] != [NSNull null] && [[issue objectForKey:@"fields"] objectForKey:@"assignee"] != [NSNull null] && [[[issue objectForKey:@"fields"] objectForKey:@"assignee"] objectForKey:@"displayName"] !=[NSNull null]){
                        newIssue.assigneeName =  [[[issue objectForKey:@"fields"] objectForKey:@"assignee"] objectForKey:@"displayName"];
                }
                [self.issues addObject:newIssue];
                //NSLog(@"Issues array%@", newIssue);
            }
        }
    }
    return self;
}


@end
