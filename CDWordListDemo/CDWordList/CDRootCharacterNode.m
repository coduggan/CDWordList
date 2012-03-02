//
//  CDRootCharacterNode.m
//  CDWordListDemo
//
//  Created by Connor Duggan on 12-03-02.
//  Copyright (c) 2012 Connor Duggan. All rights reserved.
//

#import "CDRootCharacterNode.h"

@implementation CDRootCharacterNode

-(id)initWithFilePath:(NSString*)filePath
{
	if((self = [super init]))
	{             
		NSString * fileString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:nil];
        
        NSAutoreleasePool * outerPool = [NSAutoreleasePool new];
        
		NSArray * lines = [fileString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
		
		[fileString release];
		
		for(NSString * s in lines)
		{
            NSAutoreleasePool * innerPool = [NSAutoreleasePool new];
            
            [self addWord:s];
            
            [innerPool drain];
		}
        
        [outerPool drain];

	}
	return self;
}

-(void)addWord:(NSString*)word
{
	CDCharacterNode * currentNode = self;
	
	for(int i = 0; i < [word length]; i++)
	{		
		CDCharacterNode * temp = [currentNode nodeContainingUnichar:[word characterAtIndex:i]];
				
		if(!temp)
		{
			temp = [CDCharacterNode nodeWithUnichar:[word characterAtIndex:i]];
			
			if(i == [word length] - 1)
			{
				temp.leaf = YES;
			}
			[currentNode addNode:temp];
			temp = [currentNode lastNode];
		}
        else if(i == [word length] - 1)
        {
            temp->leaf = YES;
            return;
        }
        
		currentNode = temp;
	}
}

-(BOOL)isWord:(NSString*)word
{
    word = [word lowercaseString];
    
	CDCharacterNode * currentNode = self;
	
	for(int i = 0; i < [word length]; i++)
	{
		CDCharacterNode * temp = [currentNode nodeContainingUnichar:[word characterAtIndex:i]];
		if(!temp)
		{
			return NO;
		}
		currentNode = temp;
	}
	
	return currentNode.leaf;
}

-(void)dealloc
{
    [self freeChildren];
    [super dealloc];
}

@end
