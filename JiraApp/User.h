//
//  User.h
//  JiraApp
//
//  Created by Slavena  on 9/20/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "lead": {
 "self": "http://www.example.com/jira/rest/api/2/user?username=fred",
 "name": "fred",
 "avatarUrls": {
 "24x24": "http://www.example.com/jira/secure/useravatar?size=small&ownerId=fred",
 "16x16": "http://www.example.com/jira/secure/useravatar?size=xsmall&ownerId=fred",
 "32x32": "http://www.example.com/jira/secure/useravatar?size=medium&ownerId=fred",
 "48x48": "http://www.example.com/jira/secure/useravatar?size=large&ownerId=fred"
 },
 "displayName": "Fred F. User",
 "active": false
 },
 */
@interface User : NSObject
@property (nonatomic, strong) NSString *profileURL;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, readwrite) BOOL active;

-(id)initWithJSON:(NSDictionary*) data;
@end



