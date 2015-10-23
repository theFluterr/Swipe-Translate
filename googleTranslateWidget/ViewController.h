//
//  ViewController.h
//  googleTranslateWidget
//
//  Created by Mark Vasiv on 27/08/15.
//  Copyright (c) 2015 Mark Vasiv. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SeparatedButton.h"
#import "Parser.h"
#import "LanguagesStorage.h"
#import "PopupMenu.h"
#import "RequestHandler.h"

@interface ViewController : NSViewController

//Outlets from View
@property (strong) IBOutlet NSTextField *sourceLanguage;
@property (strong) IBOutlet NSTextField *targetLanguage;
@property (strong) IBOutlet NSButton *autoLanguageButton;
@property (strong) IBOutlet NSTableView *languageTable;

//Actions from View
- (IBAction)enableLiveTranslate:(id)sender;
- (IBAction)enableAutoLanguage:(id)sender;
- (IBAction)swapButton:(id)sender;

//Storing data properties
@property NSString* sLanguage;
@property NSString* tLanguage;

@end

