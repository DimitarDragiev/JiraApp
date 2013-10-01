//
//  IssueFilterViewController.h
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/30/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IssueFilterViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *statusTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;
@property (weak, nonatomic) IBOutlet UITextField *resolutionTextField;
@property (weak, nonatomic) IBOutlet UITextField *issueNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *issueIdTextField;

@end
