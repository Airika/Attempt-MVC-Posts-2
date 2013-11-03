//
//  CreateNewPost.h
//  Attempt Posts 2
//
//  Created by Erika Martinez on 10/29/13.
//  Copyright (c) 2013 Erika Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Textview.h"
#import "Post.h"


@protocol theProtocol <NSObject>

@optional
- (void)addPostToTable:(Post *)newPost;
- (void)editPost:(Post *)post atIndex:(NSIndexPath *)index;

@end

@interface CreateNewPost : UIViewController <UITextViewDelegate>

@property (nonatomic, weak) IBOutlet UITextField *titleText;
@property (nonatomic, weak) IBOutlet Textview *content;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *postButton;

@property (nonatomic, weak) id delegate;

- (IBAction)cancelNewPost:(id)sender;
- (IBAction)savePost:(id)sender;

@end


