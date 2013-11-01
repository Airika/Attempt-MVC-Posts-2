//
//  EditPosts.h
//  Attempt Posts 2
//
//  Created by Erika Martinez on 10/29/13.
//  Copyright (c) 2013 Erika Martinez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditPosts.h"

@protocol EditPostsDelegate <NSObject>

- (void)reloadTheTable;

@end

@interface EditPostsDelegate : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *userNameField, *titleField, *contentField, *timeStampField;

@property (nonatomic, weak) id<EditPostsDelegate> delegate;

- (IBAction)savePost:(id)sender;

@end
