//
//  MainApplicationMenu.m
//  googleTranslateWidget
//
//  Created by Andrei on 12/11/15.
//  Copyright © 2015 Mark Vasiv. All rights reserved.
//

#import "MainApplicationMenu.h"

@implementation MainApplicationMenu

+(NSMenuItem*)createEditMenu{
    MainApplicationMenu *editMenuItem = [[super alloc] initWithTitle:@"Edit" action:NULL keyEquivalent:@""];
    NSMenu *editMenu = [[NSMenu alloc] initWithTitle:@"Edit"];
   
    MainApplicationMenu *copyItem = [[super alloc] initWithTitle:@"Copy" action:@selector(copy:) keyEquivalent:@"c"];
    MainApplicationMenu *pasteItem = [[super alloc] initWithTitle:@"Paste" action:@selector(pasteAsPlainText:) keyEquivalent:@"v"];
    MainApplicationMenu *cutItem = [[super alloc] initWithTitle:@"Cut" action:@selector(cut:) keyEquivalent:@"x"];
    
    [editMenu addItem:copyItem];
    [editMenu addItem:pasteItem];
    [editMenu addItem:cutItem];
    [editMenuItem setSubmenu:editMenu];
    
    return editMenuItem;
}

+(NSMenuItem*)createFileMenu{

    MainApplicationMenu *fileMenuItem = [[super alloc] initWithTitle:@"File" action:NULL keyEquivalent:@""];
    NSMenu *fileMenu = [[NSMenu alloc] initWithTitle:@"File"];
    MainApplicationMenu *liveTranslate = [[super alloc] initWithTitle:@"Live Translate" action:@selector(swapState) keyEquivalent:@"l"];
    MainApplicationMenu *favouritesSidebar = [[super alloc] initWithTitle:@"Show Favourites" action:@selector(openBar) keyEquivalent:@"s"];
    
    [liveTranslate setTarget:liveTranslate];
    [liveTranslate setState:1];
    [liveTranslate setEnabled:YES];
    
    [favouritesSidebar setState:0];
    [favouritesSidebar setEnabled:YES];
    
    [fileMenu addItem: liveTranslate];
    [fileMenu addItem: favouritesSidebar];
    [fileMenuItem setSubmenu: fileMenu];
    
    return fileMenuItem;
}
-(void)swapState {

    NSInteger s=[self state];
    if (s)
        [self setState:0];
    else
        [self setState:1];
}

@end
