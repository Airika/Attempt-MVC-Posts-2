//
//  PostViewController.m
//  Attempt Posts 2
//
//  Created by Erika Martinez on 10/29/13.
//  Copyright (c) 2013 Erika Martinez. All rights reserved.
//

#import "PostViewController.h"
#import "Custom Cell.h"
#import "Post.h"
#import "EditPosts.h"

@interface PostViewController ()

@end

@implementation PostViewController
@synthesize userNameTextField;

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
    
    self.tableView.dataSource = self;
    self.tableView.delegate =self;
    
    Post *post1 = [[Post alloc] init];
    post1.title = @"Chosen Four";
    post1.userName = @"Ness";
    post1.content = @"Smash!";
    
    Post *post2 = [[Post alloc] init];
    post2.title = @"Chosen Four";
    post2.userName = @"Ness";
    post2.content = @"Smash!";
    
    _characters = [NSMutableArray arrayWithObjects: post1, post2, nil];

    //
    //    title = [[NSArray alloc] initWithObjects:@"Chosen Four", nil];
    //    userName = [[NSArray alloc] initWithObjects:@"Ness",@"Paula",@"Poo",@"Jeff", nil];
    //    content = [[NSArray alloc] initWithObjects:@"Smash!",@"Pray",@"Meditate",@"Rocket Bottle", nil];
    
    
    
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
    return self.characters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    Custom_Cell *Cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!Cell) {
        Cell = [[Custom_Cell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
    }
    
    
    
    Cell.title.text = [[self.characters objectAtIndex: indexPath.row] title];
    Cell.content.text = [[self.characters objectAtIndex: indexPath.row] title];
    Cell.userName.text = [[self.characters objectAtIndex: indexPath.row] title];
    
    return Cell;
}
         
         
         - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
        if ([segue.identifier isEqualToString:@"EditPosts"]) {
            EditPosts *editVC = segue.destinationViewController;
            NSInteger selectedRow = [[self.tableView indexPathForSelectedRow] row];
            editVC.post = Post[selectedRow];
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

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */
    }
@end
