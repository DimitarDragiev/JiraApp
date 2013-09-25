//
//  Project.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "Project.h"

@implementation Project

-(id)initWithJSON:(NSDictionary*) data{
    self = [super init];
    if(self){
    
        self.projectID = [data objectForKey:@"id"];
        self.key = [data objectForKey:@"key"];
        self.name = [data objectForKey:@"name"];
        self.url = [data objectForKey:@"self"];
    }
    return self;
}


@end
