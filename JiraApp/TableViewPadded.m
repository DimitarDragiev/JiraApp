//
//  TableViewPadded.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/25/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "TableViewPadded.h"

@implementation TableViewPadded{
    CGFloat padding;
}

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        padding = 5;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        padding = 5.;
    }
    return self;
}

-(void)setFrame:(CGRect)frame{
    frame.size.width = frame.size.width - padding*2;
    frame.origin.x = padding;
    [super setFrame:frame];
}
@end
