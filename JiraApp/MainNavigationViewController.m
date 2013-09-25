//
//  MainNavigationViewController.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/23/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "MainNavigationViewController.h"

@interface MainNavigationViewController ()

@end

@implementation MainNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
