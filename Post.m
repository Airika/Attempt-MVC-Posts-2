//
//  Post.m
//  Attempt Posts 2
//
//  Created by Erika Martinez on 11/3/13.
//  Copyright (c) 2013 Erika Martinez. All rights reserved.
//

#import "Post.h"

@implementation Post

-(void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:self.userName forKey:@"userName"];
	[aCoder encodeObject:self.title forKey:@"title"];
	[aCoder encodeObject:self.content forKey:@"content"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
    if (!self) {
        return nil;
    }
	
	self.userName = [aDecoder decodeObjectForKey:@"userName"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.content = [aDecoder decodeObjectForKey:@"content"];

	return self;
}

@end