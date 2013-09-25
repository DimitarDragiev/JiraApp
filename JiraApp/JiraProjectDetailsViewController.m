//
//  JiraProjectDetailsViewController.m
//  JiraApp
//
//  Created by Slavena  on 9/20/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "JiraProjectDetailsViewController.h"
#import "JiraRestClientAPI.h"
#import "Project.h"
@interface JiraProjectDetailsViewController ()

@end

@implementation JiraProjectDetailsViewController
@synthesize projectKeyLabel, projectKey, projectDescription, projectDescriptionLabel, projectOwner, projectOwnerLabel, issueName, issueDescription;

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
    projectKeyLabel.text = projectKey;
    
    [[JiraRestClientAPI sharedClient] getProjectDetailsWithKey: self.projectKey andSuccessBlock:^(Project *data) {
        projectOwnerLabel.text = [data lead].name;
        projectDescriptionLabel.text = [data description];
        issueName.text = [[[data issues] objectAtIndex:0] objectForKey:@"name"];
        issueDescription.text = [[[data issues] objectAtIndex:0] objectForKey:@"description"];
        for(id issue in [data issues]){
            NSLog(@"%@ %@", [issue objectForKey:@"name"], [issue objectForKey:@"description"]);
        }
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

