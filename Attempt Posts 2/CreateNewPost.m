//
//  CreateNewPost.m
//  Attempt Posts 2
//
//  Created by Erika Martinez on 10/29/13.
//  Copyright (c) 2013 Erika Martinez. All rights reserved.
//

#import "CreateNewPost.h"
#import "Post.h"

@interface CreateNewPost ()
@end

@implementation CreateNewPost

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
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
    self.content.placeholderText = @"Say something...";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelNewPost:(id)sender
{
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)savePost:(id)sender
{
    NSString *title = self.titleText.text;
    NSString *content = self.content.text;
    
    Post *newPost = [[Post alloc] init];
    newPost.userName = @"Ness";
    newPost.title = title;
    newPost.content = content;

    CreateNewPost *newPostcontroller = [[CreateNewPost alloc] init];
    newPostcontroller.delegate = self;
    
    [self.delegate addPostToTable:newPost];
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)textViewDidChange:(UITextView *)textView
{
    if ([textView.text length] > 0)
    {
        [self.postButton setEnabled:YES];
    }
    else
    {
        [self.postButton setEnabled: NO];
    }
}


@end
