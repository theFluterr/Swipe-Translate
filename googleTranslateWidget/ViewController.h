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
#import "DataSource.h"
#import "DataSourceDelegate.h"
#import "InputTextView.h"
#import "ValidateTextView.h"
#import "RequestReceiver.h"
#import "SavedInfo.h"
#import "MainApplicationMenu.h"
#import "FavouritesListView.h"
#import "NSMutableSet+TouchSet.h"
#import "FavouritesDataHandler.h"
#import "NSAttributedString+Trimming.h"
#import "FavouritesHandlerDelegate.h"
#import "FavouritesHintView.h"


@interface ViewController : NSViewController<DataSourceDelegate, FavouritesHandlerDelegate, ResponseReceiver, NSTextFieldDelegate, NSTextViewDelegate> {
    float touchDistance;
    BOOL inTouch;
}

//Outlets from View
@property (strong) IBOutlet NSTextField *sourceLanguage;
@property (strong) IBOutlet NSTextField *targetLanguage;
@property (strong) IBOutlet NSButton *autoLanguageButton;
@property (strong) IBOutlet NSTableView *sourceLanguageTable;
@property (strong) IBOutlet NSTableView *targetLanguageTable;
@property (strong) IBOutlet DataSource *dataHandler;
@property (strong) IBOutlet NSView *rightSplittedView;
@property (strong) IBOutlet InputTextView *inputText;
@property (strong) IBOutlet NSTextView *outputText;
@property (strong) IBOutlet NSButton *clearTextButton;
@property (strong) IBOutlet InputScroll *inputScrollView;
@property (strong) IBOutlet NSProgressIndicator *requestProgressIndicator;
@property (strong) IBOutlet favouritesListView *favouritesView;
@property (strong) IBOutlet FavouritesDataHandler *favouritesHandler;
@property (strong) IBOutlet NSTableView *favouritesTable;
@property (strong) IBOutlet NSButton *favouritesStar;
@property (strong) IBOutlet NSVisualEffectView *favouritesVisualEffectsView;
@property (strong) IBOutlet NSButton *openHintBarButton;

@property (strong) IBOutlet FavouritesHintView *favouritesHintView;


//Actions from View
- (IBAction)enableAutoLanguage:(id)sender;
- (IBAction)swapButton:(id)sender;
- (IBAction)showSourceMenu:(id)sender;
- (IBAction)showTargetMenu:(id)sender;
- (IBAction)clearTextButtonAction:(id)sender;
- (IBAction)starButton:(id)sender;
- (IBAction)openHintBar:(id)sender;

-(void)openBar;

//Methods
-(void)sourceMenuClick:(id)sender;
-(void)targetMenuClick:(id)sender;

//Storing data properties
@property NSString* sLanguage;
@property NSString* tLanguage;
@property NSString* autoLanguage;
@property SavedInfo *localDefaults;
@property NSMutableSet *initialTouches;
@property NSAttributedString *translateText;
@property NSMutableArray *favouritesArray;

//Menu properties
@property NSMenu *sourceLanguageMenu;
@property NSMenu *targetLanguageMenu;
@property NSMenuItem *liveTranslate;

@property RequestHandler *translateHandler;
@property RequestHandler *dictionaryHandler;

@end

