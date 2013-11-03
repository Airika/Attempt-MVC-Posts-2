//
//  Post.h
//  Attempt Posts 2
//
//  Created by Erika Martinez on 11/3/13.
//  Copyright (c) 2013 Erika Martinez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject <NSCoding>
{
	NSString* mStringValue;
}

@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *content;
@end