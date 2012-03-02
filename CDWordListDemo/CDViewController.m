//
//  CDViewController.m
//  CDWordListDemo
//
//  Created by Connor Duggan on 12-03-02.
//  Copyright (c) 2012 Connor Duggan. All rights reserved.
//

#import "CDViewController.h"
#import "CDWordList.h"

@implementation CDViewController

-(void)viewDidLoad
{
    wordList = [[CDWordList alloc] initWithFilePath:[[NSBundle mainBundle] pathForResource:@"word_list" ofType:@"txt"]];
    
    [theTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [theTextField becomeFirstResponder];
}

-(void)textFieldDidChange:(UITextField*)textField
{
    isWordLbl.text = [wordList isWord:textField.text]? @"YES" : @"NO";
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)dealloc
{
    [wordList release];
    
    [super dealloc];
}

@end
