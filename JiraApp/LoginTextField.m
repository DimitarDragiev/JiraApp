//
//  LoginTextField.m
//  JiraApp
//
//  Created by Slavena  on 9/23/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "LoginTextField.h"
#import <NUI/UITextField+NUI.h>

@implementation LoginTextField

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
         self.nuiClass = @"TextField:LoginTextField";
    }
    return self;
}
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
    //[self ]
//    self.leftView.nuiClass = @"LoginTextFieldIcon";
//    [NUIRenderer renderView:self.leftView];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
