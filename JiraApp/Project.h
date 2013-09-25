//
//  Project.h
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface Project : NSObject

@property (nonatomic,strong) NSNumber * projectID;
@property (nonatomic,strong) NSString * key;
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSString * url;
@property (nonatomic, strong) User *lead;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSMutableArray *issues;

-(id)initWithJSON:(NSDictionary*) data;



@end
