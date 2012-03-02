//
//  CDWordList.h
//  CDWordListDemo
//
//  Created by Connor Duggan on 12-03-02.
//  Copyright (c) 2012 Connor Duggan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDRootCharacterNode.h"

@interface CDWordList : NSObject 
{
	CDRootCharacterNode * root;
}

-(id)initWithFilePath:(NSString*)filePath;

-(BOOL)isWord:(NSString*)word;

@end
