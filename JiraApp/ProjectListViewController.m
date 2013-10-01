//
//  ProjectListViewController.m
//  JiraApp
//
//  Created by Dimitar Dragiev on 9/19/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "ProjectListViewController.h"
#import "ProjectManager.h"
#import "Project.h"
#import "ProjectDetailsViewController.h"
#import "ProjectListCell.h"
#import "IssueFilterViewController.h"
#import "MainNavigationViewController.h"
#import <MMDrawerController.h>
@interface ProjectListViewController ()

@end

@implementation ProjectListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSMutableArray*) projectList{
    return [ProjectManager sharedManager].projects;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.storyboard instantiateViewControllerWithIdentifier:@"ProjectDetails"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self projectList].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ProjectListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Project *project = [[self projectList] objectAtIndex:indexPath.row];
    cell.textLabel.text = [project name];
    cell.accessoryView = [[ UIImageView alloc ]
                          initWithImage:[UIImage imageNamed:@"arrow_right" ]];
    
    
    // Configure the cell...

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
    Project *project = [[self projectList] objectAtIndex: indexPath.row];
    ProjectDetailsViewController* projectDetailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProjectDetails"];
    projectDetailsVC.projectKey = [project key];
    [ProjectManager sharedManager].currentProjectID = [project.key copy];
    
    ProjectDetailsViewController *pDetails = [self.storyboard instantiateViewControllerWithIdentifier:@"ProjectDetails"];
    IssueFilterViewController *issueFilterVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FilterVC"];
    MMDrawerController *drawerVC = [[MMDrawerController alloc] initWithCenterViewController:pDetails rightDrawerViewController:issueFilterVC];
    [drawerVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModePanningCenterView];
    [drawerVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    [self.navigationController pushViewController:drawerVC animated:YES];
 
//
////    SWRevealViewController* reveal = [self.storyboard instantiateViewControllerWithIdentifier:@"RevealVC"];
////    reveal.frontViewController = projectDetailsVC;
//    
//    [self.navigationController pushViewController:projectDetailsVC animated:YES];
//    [self performSegueWithIdentifier:@"showProjectDetails" sender:self];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     SWRevealViewController * revealViewController = segue.destinationViewController;
//    revealViewController.frontViewPosition = FrontViewPositionRightMost;
////    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
////    Project *project = [[self projectList] objectAtIndex:indexPath.row];
////    if ([segue.identifier isEqualToString:@"showProjectDetails"]) {
////        SWRevealViewController * destViewController = segue.destinationViewController;
////        NSLog(@"%@", destViewController.frontViewController);
////        ProjectDetailsViewController *projectDetailsVC = destViewController.frontViewController;
////        projectDetailsVC.projectKey = [project key];
////    }
////    
//}
@end
