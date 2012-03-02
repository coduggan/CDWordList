//
//  CDViewController.h
//  CDWordListDemo
//
//  Created by Connor Duggan on 12-03-02.
//  Copyright (c) 2012 Connor Duggan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDWordList.h"

@interface CDViewController : UIViewController <UITextFieldDelegate>
{
    CDWordList * wordList;
    
    IBOutlet UITextField * theTextField;
    IBOutlet UILabel * isWordLbl;
}

@end
