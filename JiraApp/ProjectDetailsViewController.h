//
//  ProjectDetailsViewController.h
//  JiraApp
//
//  Created by Slavena  on 9/24/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Project.h"


@interface ProjectDetailsViewController : UITableViewController <UITextFieldDelegate>
{
    // 
}

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic, strong) NSString *projectKey;
@property(nonatomic, strong) NSString *projectDescription;
@property(nonatomic, strong) NSString *projectOwner;
@property(nonatomic, strong) NSMutableArray *issues;
@property(nonatomic, strong) Project *currentProject;

@end
