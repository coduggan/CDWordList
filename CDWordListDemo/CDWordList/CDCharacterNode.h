//
//  CDCharacterNode.h
//  CDWordListDemo
//
//  Created by Connor Duggan on 12-03-02.
//  Copyright (c) 2012 Connor Duggan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDCharacterNode : NSObject
{
	char c;
	bool leaf;
	uint8_t numChildren;
	CDCharacterNode * children;
}

@property (nonatomic, readonly) char c;
@property (nonatomic, readonly) CDCharacterNode * children;
@property (nonatomic, assign) bool leaf;

-(id)initWithUnichar:(char)cc;

-(void)addNode:(CDCharacterNode*)node;

+(CDCharacterNode*)nodeWithUnichar:(char)cc;

-(CDCharacterNode*)nodeAtIndex:(uint8_t)index;
-(CDCharacterNode*)lastNode;


-(CDCharacterNode*)nodeContainingUnichar:(char)cc;

-(void)freeChildren;

@end
