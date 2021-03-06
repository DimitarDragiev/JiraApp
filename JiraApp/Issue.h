//
//  Issue.h
//  JiraApp
//
//  Created by Slavena  on 9/20/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 {
 "self": "http://localhost:8090/jira/rest/api/2.0/issueType/3",
 "id": "3",
 "description": "A task that needs to be done.",
 "iconUrl": "http://localhost:8090/jira/images/icons/issuetypes/task.png",
 "name": "Task",
 "subtask": false
 },
 */

@interface Issue : NSObject
@property(nonatomic, strong) NSString *issueURL;
@property(nonatomic, strong) NSNumber *issueID;
@property(nonatomic, strong) NSString *issueDescription;
@property(nonatomic, strong) NSString *issueName;
@property(nonatomic, strong) NSString *assigneeName;
@property(nonatomic, strong) NSString *issueSummary;
@property(nonatomic, strong) NSString *issueStatus;
@property(nonatomic, strong) NSString *issuePriority;
@property(nonatomic, strong) NSString *issueTypeName;

-(id)initWithJSON:(NSDictionary*) data;

@end