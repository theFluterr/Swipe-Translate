//
//  ViewController.m
//  googleTranslateWidget
//
//  Created by Mark Vasiv on 27/08/15.
//  Copyright (c) 2015 Mark Vasiv. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController


-(void)awakeFromNib{
    [super awakeFromNib];
    _sourceLanguageMenu = [PopupMenu createMenuWithAction:@"sourceMenuClick:" andSender:self];
    _targetLanguageMenu = [PopupMenu createMenuWithAction:@"targetMenuClick:" andSender:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [_targetLanguageTable setFocusRingType:NSFocusRingTypeNone];
    [_sourceLanguageTable setFocusRingType:NSFocusRingTypeNone];
   
  
}

-(void)viewWillAppear{
    
    self.view.window.titleVisibility = NSWindowTitleHidden;
    self.view.window.titlebarAppearsTransparent = YES;
    self.view.window.styleMask |= NSFullSizeContentViewWindowMask;
    [_sourceLanguageTable reloadData];
    [_targetLanguageTable reloadData];
    
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}


- (IBAction)enableLiveTranslate:(id)sender {
}

- (IBAction)enableAutoLanguage:(id)sender {
    
    if ([_autoLanguageButton state]) {
        _sLanguage = @"auto";
    }
        
    
}

//Swap button implementation
- (IBAction)swapButton:(id)sender {
    NSString *swapPlace = [NSString new];
    swapPlace = [_sourceLanguage stringValue];
    [_sourceLanguage setStringValue:[_targetLanguage stringValue]];
    [_targetLanguage setStringValue: swapPlace];
}

//Updating tables with new entries
-(void)sourceMenuClick:(id)sender{
    [_dataHandler pushNewSourceLanguage:[sender title]];
}
-(void)targetMenuClick:(id)sender{
    [_dataHandler pushNewTargetLanguage:[sender title]];
}

//Creating menu at button
- (IBAction)showSourceMenu:(id)sender {
    [NSMenu popUpContextMenu:_sourceLanguageMenu withEvent:[NSApp currentEvent] forView:sender];
}

- (IBAction)showTargetMenu:(id)sender {
    [NSMenu popUpContextMenu:_targetLanguageMenu withEvent:[NSApp currentEvent] forView:sender];
}
@end
