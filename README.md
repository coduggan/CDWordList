### What's it?

CDWordList is a prefix trie that loads in a list of words from a file, and can determine if a given input string matches any string in that file. Use for word games etc.

### How to

**Create the CDWordList object**

	  CDWordList * wordList = [[CDWordList alloc] initWithFilePath:[[NSBundle mainBundle] pathForResource:@"word_list" ofType:@"txt"]];

**Determining if a string is in the word list**

	#pragma mark - CDWordList methods
	- (BOOL)isWord:(NSString*)word;

**Examples**

  Create a CDWordList object from word_list.txt in the main bundle of the app. The included English Open Word List (EOWL) contains about 128k words.

	CDWordList * wordList = [[CDWordList alloc] initWithFilePath:[[NSBundle mainBundle] pathForResource:@"word_list" ofType:@"txt"]];

	[wordList isWord:@"irregardless"]; //returns NO
	[wordList isWord:@"regardless"]; //returns YES
	
**Word list**

The included word list is the English Open Word List (EOWL).

Copyright © J Ross Beresford 1993-1999. All Rights Reserved.

Visit http://dreamsteep.com/projects/53-the-english-open-word-list-eowl.html for more info.
