//
//  PasswordTextField.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/23/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "PasswordTextField.h"
#import <NUI/UITextField+NUI.h>

@interface PasswordTextField ()

@end

@implementation PasswordTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.nuiClass = NSStringFromClass(self.class);
    }
    return self;
}

-(void)setIcon:(UIImage*)icon{
    UIImageView *iconView = [[UIImageView alloc] initWithImage:icon];
    //    [iconView setFrame:CGRectMake(0, 0, 40, 40)];
    
    self.leftViewMode = UITextFieldViewModeAlways;
    [self setLeftView:iconView];
    [self layoutIfNeeded];
}

@end