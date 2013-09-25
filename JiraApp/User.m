//
//  User.m
//  JiraApp
//
//  Created by Slavena  on 9/20/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "User.h"

@implementation User
-(id)initWithJSON:(NSDictionary*) data{
    self = [super init];
    if(self){
        self.profileURL = [data objectForKey:@"self"];
        self.name = [data objectForKey:@"name"];
        self.displayName = [data objectForKey:@"displayName"];
        self.active = [data objectForKey:@"active"] == [NSNumber numberWithInt:1] ? TRUE : FALSE;
    }
    return self;
}
@end


