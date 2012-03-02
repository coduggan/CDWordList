//
//  CDCharacterNode.m
//  CDWordListDemo
//
//  Created by Connor Duggan on 12-03-02.
//  Copyright (c) 2012 Connor Duggan. All rights reserved.
//

#import "CDCharacterNode.h"
#import <objc/runtime.h>
#import "CDRootCharacterNode.h"
@implementation CDCharacterNode

@synthesize c, children, leaf;

-(id)initWithUnichar:(char)cc
{
	if((self = [super init]))
	{
		c = cc;
		children = NULL;
	}
	return self;
}

+(CDCharacterNode*)nodeWithUnichar:(char)cc
{
	return [[[CDCharacterNode alloc] initWithUnichar:cc] autorelease];
}

-(void)addNode:(CDCharacterNode*)node
{
 	children = (CDCharacterNode*)realloc(children, ++numChildren * class_getInstanceSize([CDCharacterNode class]));
    
    void * location = (char*)children + class_getInstanceSize([CDCharacterNode class]) * (numChildren - 1);
    
	memcpy(location, node, class_getInstanceSize([CDCharacterNode class]));
}

-(CDCharacterNode*)nodeAtIndex:(uint8_t)index
{
    return (CDCharacterNode*)((char*)children + class_getInstanceSize([CDCharacterNode class]) * index);
}

-(CDCharacterNode*)lastNode
{
	if(numChildren)
	{
        return [self nodeAtIndex:numChildren - 1];
	}
	
	return nil;
}

- (BOOL)isEqual:(id)other
{
	return self.c == ((CDCharacterNode*)other).c;
}

- (NSUInteger)hash
{
	return self.c;
}

-(CDCharacterNode*)nodeContainingUnichar:(char)cc
{
	for(uint8_t i = 0; i < numChildren; i++)
	{
        CDCharacterNode * node = (CDCharacterNode*)((char*)children + class_getInstanceSize([CDCharacterNode class]) * i);
		if(node.c == cc) return node;
	}
	return nil;
}

-(void)freeChildren
{
    for(uint8_t i = 0; i < numChildren; i++)
	{
        CDCharacterNode * node = (CDCharacterNode*)((char*)children + class_getInstanceSize([CDCharacterNode class]) * i);
        [node freeChildren];
	}
    
    free(children);
}

@end
