//
//  TodayViewController.h
//  todayWidget
//
//  Created by Mark Vasiv on 27/08/15.
//  Copyright (c) 2015 Mark Vasiv. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@import AppKit;
#import "SeparatedButton.h"
#import "GoogleString.h"

//Ptotocol for getting response from asyncronous request
@protocol asynchronousRequests <NSObject>
- (void)receivedResponseFromRequest:(NSData *)data;
@end


@interface TodayViewController : NSViewController


//Outlets from view
@property (strong) IBOutlet NSView *widgetMainView;

@property (strong) IBOutlet NSTextView *inputText;
@property (strong) IBOutlet NSTextView *outputText;


@property (weak) IBOutlet SeparatedButton *sourceSegmentedButton;
@property (weak) IBOutlet SeparatedButton *targetSegmentedButton;

@property (strong) IBOutlet NSMenu *sourceLanguageMenu;
@property (strong) IBOutlet NSMenu *targetLanguageMenu;


//Properties for storing data
@property NSArray* languages;
@property NSString * sLanguage;
@property NSString * tLanguage;
@property NSMutableArray * quotesArray;

//IBActions and other methods to handle actions from view
- (IBAction)sourceTabClick:(id)sender;
- (IBAction)targetTabClick:(id)sender;
- (IBAction)swapButton: (id)sender;
- (void)sourceTabDropDownClick:(id)sender;
- (void)targetTabDropDownClick:(id)sender;
- (void)textDidChange:(NSNotification *)notification;


//Methods for managing data
-(void)updateSourceLanguage;
-(void)updateTargetLanguage;
-(void)performGoogleRequest;
-(void)setOutputValue:(NSString *)value;


//Preferences 


@end





