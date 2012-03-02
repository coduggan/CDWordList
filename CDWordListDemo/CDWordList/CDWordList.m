//
//  CDWordList.m
//  CDWordListDemo
//
//  Created by Connor Duggan on 12-03-02.
//  Copyright (c) 2012 Connor Duggan. All rights reserved.
//

#import "CDWordList.h"

@implementation CDWordList

-(id)initWithFilePath:(NSString*)filePath
{
	if((self = [super init]))
	{
		root = [[CDRootCharacterNode alloc] initWithFilePath:filePath];
    }
    
    return self;
}

-(BOOL)isWord:(NSString*)word
{
	return [root isWord:word];
}

-(void)dealloc
{
    [root release];
    [super dealloc];
}


@end
