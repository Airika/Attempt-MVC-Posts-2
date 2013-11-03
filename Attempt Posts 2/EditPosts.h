//
//  EditPosts.h
//  Attempt Posts 2
//
//  Created by Erika Martinez on 10/29/13.
//  Copyright (c) 2013 Erika Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditPosts.h"
#import "CreateNewPost.h"
#import "Post.h"


@interface EditPosts : UIViewController <theProtocol>

@property (nonatomic, weak) IBOutlet UITextField *titleText;
@property (nonatomic, weak) IBOutlet Textview *content;
@property (nonatomic, weak) Post *post;
@property (nonatomic, weak) NSString *titleString;
@property (nonatomic, weak) NSString *contentString;
@property (nonatomic, weak) NSIndexPath *postIndex;

@property (nonatomic, weak) id delegate;

- (IBAction)savePost:(id)sender;

@end
