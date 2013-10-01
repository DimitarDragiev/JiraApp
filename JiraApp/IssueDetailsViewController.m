//
//  IssueDetailsViewController.m
//  JiraApp
//
//  Created by Slavena  on 9/26/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "IssueDetailsViewController.h"
#import "JiraRestClientAPI.h"
@interface IssueDetailsViewController ()

@end

@implementation IssueDetailsViewController

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
	// Do any additional setup after loading the view.
    self.issueIDLabel.text = self.issueID;
    
    
    [[JiraRestClientAPI sharedClient] getIssueDetailsWithKey: [[NSString alloc] initWithFormat: @"%@", self.issueID] andSuccessBlock:^(id data) {
        NSLog(@"Issue data: %@", [[data objectForKey:@"fields"] objectForKey:@"status"]);
        self.issueDescriptionLabel.text = [[[data objectForKey:@"fields"] objectForKey:@"status"] objectForKey:@"name"];
        self.issueIDLabel.text = [[[data objectForKey:@"fields"] objectForKey:@"issuetype"] objectForKey:@"name"];
        self.issueCommentLabel.text = [[[data objectForKey:@"fields"] objectForKey:@"priority"] objectForKey:@"name"];
    } andFailureBlock:^(NSError *error) {
        [[[UIAlertView alloc] initWithTitle:@""
                                    message:[error localizedDescription]
                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                          otherButtonTitles: nil] show];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
