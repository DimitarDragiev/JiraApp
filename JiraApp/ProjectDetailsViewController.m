//
//  ProjectDetailsViewController.m
//  JiraApp
//
//  Created by Slavena  on 9/24/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "ProjectDetailsViewController.h"
#import "JiraRestClientAPI.h"
#import "IssueDetailsViewController.h"
#import "Project.h"
#import "Issue.h"

@interface ProjectDetailsViewController ()

@end

@implementation ProjectDetailsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.issues = [NSMutableArray new];
    [[JiraRestClientAPI sharedClient] getProjectDetailsWithKey: self.projectKey andSuccessBlock:^(Project *data) {
        NSLog(@"RESPONSE%@", [data.issues objectAtIndex:0]);
        /*self.projectOwner = [data lead].name;
        self.projectDescription = [data description];
        */
        [self.issues removeAllObjects];
        for(Issue *issue in [data issues]){
            //Issue *newIssue = [[Issue alloc] initWithJSON:issue];
            [self.issues addObject: issue];
        }
        [self.tableView reloadData];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSLog(@"Number of rows: %@", self.issues);
    return [self.issues count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Issue *issue = [[self issues] objectAtIndex:indexPath.row];
    //cell.textLabel.text = issue.issueSummary;
    
    cell.accessoryView = [[ UIImageView alloc ]
                          initWithImage:[UIImage imageNamed:@"arrow_right" ]];

    
    UILabel *projectKeyLabel = (UILabel *)[cell viewWithTag:2];
    projectKeyLabel.text = self.projectKey;
    
    UILabel *issueDetailsLabel = (UILabel *)[cell viewWithTag:3];
    issueDetailsLabel.text = issue.issueSummary;
    
    
    UILabel *issueAssigneeLabel = (UILabel *)[cell viewWithTag:4];
    issueAssigneeLabel.text = issue.assigneeName;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Issue *issue = [self.issues objectAtIndex:indexPath.row];
    if ([segue.identifier isEqualToString:@"showIssueDetail"]) {
        IssueDetailsViewController *destViewController = segue.destinationViewController;
        NSLog(@"%@", issue.issueID);
        destViewController.issueID = issue.issueID;
        
    }
    
}

@end
