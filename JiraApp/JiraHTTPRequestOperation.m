//
//  JiraHTTPRequestOperation.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/25/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "JiraHTTPRequestOperation.h"

@implementation JiraHTTPRequestOperation
+ (NSIndexSet *)acceptableStatusCodes{
    return [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 300)];
}

@end
