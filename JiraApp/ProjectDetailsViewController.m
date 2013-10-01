//
//  ProjectDetailsViewController.m
//  JiraApp
//
//  Created by Slavena  on 9/24/13.
//  Copyright (c) 2013 Dimitar Dragiev. All rights reserved.
//

#import "ProjectDetailsViewController.h"
#import "JiraRestClientAPI.h"
#import "Project.h"
#import "ProjectManager.h"
#import "Issue.h"
#import <UIButton+NUI.h>
#import <NUIRenderer.h>
#import <UIViewController+MMDrawerController.h>

@interface ProjectDetailsViewController ()

@end

@implementation ProjectDetailsViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.projectKey = [ProjectManager sharedManager].currentProjectID;
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
//    UIBarButtonItem *_sidebarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
//                                                                                    target:self action:@selector(toggleRightDrawer)];
    UIImage *searchButtonImg = [UIImage imageNamed:@"search_icon"];
//    UIBarButtonItem *_sidebarButton = [[UIBarButtonItem alloc]initWithImage:backButtonImg style:UIBarButtonItemStylePlain target:self action:@selector(toggleRightDrawer)];
    UIButton *searchButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    [searchButton setImage:searchButtonImg forState:UIControlStateNormal];
    [searchButton setNuiClass:@"BarButton"];
    UIBarButtonItem *_sidebarButton = [[UIBarButtonItem alloc]initWithCustomView:searchButton];
    [searchButton addTarget:self action:@selector(toggleRightDrawer) forControlEvents:UIControlEventTouchUpInside];
    UIImage *backButtonImg = [UIImage imageNamed:@"icon_back"];
//    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:backButtonImg style:UIBarButtonItemStyleBordered target:nil action:nil];
//    self.parentViewController.navigationItem.backBarButtonItem = btn;
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    [backButton setImage:backButtonImg forState:UIControlStateNormal];
    [backButton setNuiClass:@"BarButton"];
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [backButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    self.parentViewController.navigationItem.leftBarButtonItem = backButtonItem;
    self.parentViewController.navigationItem.rightBarButtonItem = _sidebarButton;
//    [NUIRenderer renderBarButtonItem:_sidebarButton withClass:@"BarButton"];
//    [NUIRenderer renderNavigationItem:self.parentViewController.navigationItem.rightBarButtonItem];
    
    
    
    
    // Set the gesture
    
//    [self.storyboard instantiateViewControllerWithIdentifier:@"ProjectDetails"];


    
	// Do any additional setup after loading the view.
    self.issues = [NSMutableArray new];
    [[JiraRestClientAPI sharedClient] getProjectDetailsWithKey: self.projectKey andSuccessBlock:^(Project *data) {
        //NSLog(@"%@", data);
        self.projectOwner = [data lead].name;
        self.projectDescription = [data description];
        [self.issues removeAllObjects];
        for(id issue in [data issues]){
            Issue *newIssue = [[Issue alloc] initWithJSON:issue];
            [self.issues addObject: newIssue];
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

-(void)popViewController{
    [ self.navigationController popViewControllerAnimated:YES];
}

-(void)toggleRightDrawer{
    [self.mm_drawerController toggleDrawerSide: MMDrawerSideRight animated: YES completion: nil];
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
    cell.textLabel.text = issue.issueName;
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
-(BOOL)textfieldShouldReturn:(UITextField*)texfield{
    [texfield resignFirstResponder];
    return YES;
}

@end
