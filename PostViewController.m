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
#import "CreateNewPost.h"

@interface PostViewController ()

@property (nonatomic) NSMutableArray *characters;

@end

@implementation PostViewController


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
    
    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *filename = [docsPath stringByAppendingPathComponent:@"postsArchive"];
	
	if ([NSKeyedUnarchiver unarchiveObjectWithFile:filename])
	{
		NSLog(@"Unarchiving existing posts");
		_characters =  [NSKeyedUnarchiver unarchiveObjectWithFile:filename];
	}
	else
	{
    
    self.tableView.dataSource = self;
    self.tableView.delegate =self;
    
    Post *post1 = [[Post alloc] init];
    post1.title = @"Chosen Four";
    post1.userName = @"Ness";
    post1.content = @"Smash!";
    
    Post *post2 = [[Post alloc] init];
    post2.title = @"New";
    post2.userName = @"Paula";
    post2.content = @"Pray";
    
    Post *post3 = [[Post alloc] init];
    post2.title = @"Tech";
    post2.userName = @"Jeff";
    post2.content = @"Bottle Rocket!";
        
        
    
    _characters = [NSMutableArray arrayWithObjects: post1, post2, post3, nil];
    [NSKeyedArchiver archiveRootObject:_characters toFile:filename];
    }
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
    Custom_Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.userName.text = [_characters [indexPath.row] userName];
    cell.title.text = [_characters[indexPath.row] title];
    cell.content.text = [_characters[indexPath.row] content];
    
    return cell;
}
         
         
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"compose"])
    {
        CreateNewPost *CreateNewPostcontroller = [segue destinationViewController];
        CreateNewPostcontroller.delegate= self;
    }
    else if ([segue.identifier isEqualToString:@"showPostDetail"])
	{
		EditPosts *editPostViewController = segue.destinationViewController;
		NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		editPostViewController.delegate = self;
		editPostViewController.titleString = [_characters[indexPath.row] title];
		editPostViewController.contentString = [_characters[indexPath.row] content];
		editPostViewController.postIndex = indexPath;
		
	}
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return true;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.characters removeObjectAtIndex:indexPath.row];
	
	NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *filename = [docsPath stringByAppendingPathComponent:@"postsArchive"];
	
	[NSKeyedArchiver archiveRootObject:_characters
                             toFile:filename];
	
	[self.tableView reloadData];
	
	if (_characters.count == 0)
	{
		[self.editButton setTitle:@"Edit"];
	}
}

- (IBAction)enterEditMode:(id)sender
{
	if ([self.tableView isEditing]) {
		// If the tableView is already in edit mode, turn it off. Also change the title of the button to reflect the intended verb (‘Edit’, in this case).
		[self.tableView setEditing:NO animated:YES];
		[self.editButton setTitle:@"Edit"];
		NSLog(@"Leaving edit mode");
	}
	else {
		[self.editButton setTitle:@"Done"];
		
		// Turn on edit mode
		
		[self.tableView setEditing:YES animated:YES];
		NSLog(@"Entering edit mode");
	}
}

- (void)addPostToTable:(Post *)newPost
{
    [_characters insertObject:newPost atIndex:0];
	
	NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *filename = [docsPath stringByAppendingPathComponent:@"postsArchive"];
	
	[NSKeyedArchiver archiveRootObject:_characters toFile:filename];
    
    [self.tableView reloadData];
	
	NSLog(@"Added new post to posts array");
}

- (void)editPost:(Post *)post atIndex:(NSIndexPath *)index
{
	NSUInteger *postIndex = index.row;
	[_characters removeObjectAtIndex:postIndex];
	[self.tableView reloadData];
	
	[self addPostToTable:post];
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

@end
