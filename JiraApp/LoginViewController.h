//
//  JiraAppViewController.h
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeychainItemWrapper.h"
#import "LoginTextField.h"
#import "PasswordTextField.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate>
- (IBAction)loginTapped:(id)sender;
@property (weak, nonatomic) IBOutlet LoginTextField *userName;
@property (weak, nonatomic) IBOutlet LoginTextField *password;
@property  KeychainItemWrapper *keychain;

@property (weak, nonatomic) IBOutlet UIButton *rememberMeButton;
- (IBAction)rememberMeTapped:(id)sender;

@end
