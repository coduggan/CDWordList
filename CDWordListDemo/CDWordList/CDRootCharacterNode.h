//
//  CDRootCharacterNode.h
//  CDWordListDemo
//
//  Created by Connor Duggan on 12-03-02.
//  Copyright (c) 2012 Connor Duggan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDCharacterNode.h"

@interface CDRootCharacterNode : CDCharacterNode
{
	
}

-(id)initWithFilePath:(NSString*)filePath;

-(void)addWord:(NSString*)word;
-(BOOL)isWord:(NSString*)word;

@end
