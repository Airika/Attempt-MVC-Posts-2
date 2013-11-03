//
//  EditPosts.m
//  Attempt Posts 2
//
//  Created by Erika Martinez on 10/29/13.
//  Copyright (c) 2013 Erika Martinez. All rights reserved.
//

#import "EditPosts.h"
#import "Textview.h"


@interface EditPosts ()

@end

@implementation EditPosts

@synthesize titleText;
@synthesize content;

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
	
	self.titleText.text = self.titleString;
	self.content.text = self.contentString;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updatePost:(id)sender
{
	NSString *title = self.titleText.text;
	NSString *content = self.content.text;
	
	Post *newPost = [[Post alloc] init];
    newPost.userName = @"Ness";
    newPost.title = title;
    newPost.content = content;
    [self.delegate editPost:newPost atIndex:self.postIndex];
    [[self navigationController] popViewControllerAnimated:YES];
	
}

@end
