//
//  JiraProjectDetailsViewController.h
//  JiraApp
//
//  Created by Slavena  on 9/23/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JiraProjectDetailsViewController : UIViewController
@property(nonatomic, weak) IBOutlet UILabel *projectKeyLabel;
@property(nonatomic, strong) NSString *projectKey;
@property(nonatomic, weak) IBOutlet UILabel *projectDescriptionLabel;
@property(nonatomic, strong) NSString *projectDescription;
@property(nonatomic, weak) IBOutlet UILabel *projectOwnerLabel;
@property(nonatomic, strong) NSString *projectOwner;
@property(nonatomic, strong) IBOutlet UILabel *issueName;
@property(nonatomic, strong) IBOutlet UILabel *issueDescription;

@end

