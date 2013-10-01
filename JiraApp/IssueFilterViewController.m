//
//  IssueFilterViewController.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/30/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "IssueFilterViewController.h"

@interface IssueFilterViewController ()

@end

@implementation IssueFilterViewController
@synthesize statusTextField;
@synthesize priorityTextField;
@synthesize resolutionTextField;
@synthesize issueNameTextField;
@synthesize issueIdTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    statusTextField.delegate = self;
    priorityTextField.delegate = self;
    resolutionTextField.delegate = self;
    issueIdTextField.delegate = self;
    issueNameTextField.delegate = self;
	// Do any additional setup after loading the view.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == statusTextField){
        [ priorityTextField becomeFirstResponder];
    }
    else if(textField == priorityTextField){
        [resolutionTextField becomeFirstResponder];
    }
    else if(textField == resolutionTextField){
        [issueNameTextField becomeFirstResponder];
    
    }
    else if(textField == issueNameTextField){
        [issueIdTextField becomeFirstResponder];
    }
    else{
        [textField resignFirstResponder];
    }
    return YES;
}
-(UIScrollView*)scrollView{
    return (UIScrollView*)self.view;
}
//- (void)keyboardWasShown:(NSNotification *)notification
//{
//    
//    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    
//    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
//    self.scrollView.contentInset = contentInsets;
//    self.scrollView.scrollIndicatorInsets = contentInsets;
//    
//    CGRect aRect = self.view.frame;
//    aRect.size.height -= keyboardSize.height;
//    if (!CGRectContainsPoint(aRect, self.issueIdTextField.frame.origin) ) {
//        CGPoint scrollPoint = CGPointMake(0.0, self.issueIdTextField.frame.origin.y - (keyboardSize.height-15));
//        [self.scrollView setContentOffset:scrollPoint animated:YES];
//    }
//}
- (void)keyboardWillShow:(NSNotification *)note {
    NSDictionary *userInfo = note.userInfo;
    NSTimeInterval duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve curve = [userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    CGRect keyboardFrameEnd = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardFrameEnd = [self.view convertRect:keyboardFrameEnd fromView:nil];
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionBeginFromCurrentState | curve animations:^{
        self.view.frame = CGRectMake(0, 0, keyboardFrameEnd.size.width, keyboardFrameEnd.origin.y);
    } completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
