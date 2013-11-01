//
//  PostViewController.h
//  Attempt Posts 2
//
//  Created by Erika Martinez on 10/29/13.
//  Copyright (c) 2013 Erika Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateNewPost.h"
#import "EditPosts.h"

@interface PostViewController : UITableViewController <EditPostsDelegate>
{
    IBOutlet UITextField *userNameTextField;}

@property (nonatomic, strong) UITextField *userNameTextField;


@property (nonatomic, weak) IBOutlet UIBarButtonItem *editButton;

- (IBAction)enterEditMode:(id)sender;

@property (nonatomic) NSMutableArray *characters;

@end
