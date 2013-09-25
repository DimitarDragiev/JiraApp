//
//  JiraAppViewController.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "LoginViewController.h"
#import "JiraRestClientAPI.h"
#import "Project.h"
#import "KeychainItemWrapper.h"
#import <AFNetworking/AFNetworking.h>
#import <Security/Security.h>

@interface  LoginViewController()

@end

@implementation LoginViewController
@synthesize userName;
@synthesize password;
@synthesize keychain;

- (void)viewDidLoad
{
    self.userName.delegate = self;
    self.password.delegate = self;
//    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
//    userName.leftView = paddingView;
//    userName.leftViewMode = UITextFieldViewModeAlways;
    [self.userName setIcon:[UIImage imageNamed:@"home_icon_user"]];
    [self.password setIcon:[UIImage imageNamed:@"home_icon_pass"]];
     keychain =[[KeychainItemWrapper alloc] initWithIdentifier:@"JiraAppLoginData" accessGroup:nil];
    [userName setText:[keychain objectForKey:(__bridge id)(kSecAttrAccount)]];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(UIScrollView*)scrollView{
    return (UIScrollView*)self.view;
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
   // [sender setImage:<#(UIImage *)#> forState:<#(UIControlState)#>]
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
      UINavigationController *navController =[self.storyboard instantiateViewControllerWithIdentifier:@"MainNavigationController"];
//       [navController.view.window makeKeyAndVisible];
       [self presentViewController:navController animated:YES completion:nil];
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
- (void)keyboardWasShown:(NSNotification *)notification
{
    
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardSize.height;
    if (!CGRectContainsPoint(aRect, self.password.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, self.password.frame.origin.y - (keyboardSize.height-15));
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
}
@end
