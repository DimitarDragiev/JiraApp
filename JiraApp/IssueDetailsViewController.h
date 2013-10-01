//
//  IssueDetailsViewController.h
//  JiraApp
//
//  Created by Slavena  on 9/26/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IssueDetailsViewController : UIViewController
@property(nonatomic, weak) IBOutlet UILabel *issueIDLabel;
@property(nonatomic, weak) IBOutlet UILabel *issueDescriptionLabel;
@property(nonatomic, weak) IBOutlet UILabel *issueCommentLabel;
@property(nonatomic, strong) NSNumber *issueID;
@end
