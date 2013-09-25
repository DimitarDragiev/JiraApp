//
//  JiraAppViewController.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "JiraAppViewController.h"
#import "JiraRestClientAPI.h"
#import "Project.h"
#import "KeychainItemWrapper.h"
#import <AFNetworking/AFNetworking.h>
#import <Security/Security.h>

@interface JiraAppViewController ()

@end

@implementation JiraAppViewController
@synthesize userName;
@synthesize password;
@synthesize keychain;

- (void)viewDidLoad
{
    self.userName.delegate = self;
    self.password.delegate = self;
    [self.userName setIcon:[UIImage imageNamed:@"home-icon-user"]];
     keychain =[[KeychainItemWrapper alloc] initWithIdentifier:@"JiraAppLoginData" accessGroup:nil];
    [userName setText:[keychain objectForKey:(__bridge id)(kSecAttrAccount)]];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField
{
    if(textField == userName){
        [password becomeFirstResponder];
        
    } else {
        [textField resignFirstResponder];
    }
    // You can access textField.text and do what you need to do with the text here
    return YES; // We'll let the textField handle the rest!
}

-(IBAction)rememberMeTapped:(UIButton*)sender{
    sender.selected = !sender.selected;
    [keychain setObject:userName.text forKey:(__bridge id)kSecAttrAccount];
    if(sender.selected){
//        sender.highlighted = YES;
//        [keychain setObject:userName.text forKey:(__bridge id)kSecAttrAccount];
    }
}

- (IBAction)loginTapped:(id)sender {
    

   // [keychain setObject:userName.text forKey:(__bridge id)kSecAttrAccount];
    
    NSLog(@"username: %@", [userName text]);
    
    [[JiraRestClientAPI sharedClient] setAuthCredentials:userName.text password:password.text];    
   [[JiraRestClientAPI sharedClient] getProjectsWithSuccessBlock:^(NSArray* projects) {
       Project *project = [projects objectAtIndex:0];
       NSLog(@"%@", project);
       [self performSegueWithIdentifier:@"ProjectListVC" sender:self];
   } andFailureBlock:^(NSError *error) {
       [[[UIAlertView alloc] initWithTitle:@""
                                   message:[error localizedDescription]
                                  delegate:nil
                         cancelButtonTitle:NSLocalizedString(@"OK", nil)
                         otherButtonTitles: nil] show];
   }];
//    NSString *username = userName.text;
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:username forKey:@"username"];
//    [defaults synchronize];
//    NSLog(@"username saved");
    



}
@end
