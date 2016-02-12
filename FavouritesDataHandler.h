//
//  FavouritesDataHandler.h
//  googleTranslateWidget
//
//  Created by Andrei on 11/02/16.
//  Copyright © 2016 Mark Vasiv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface FavouritesDataHandler : NSObject{
    IBOutlet NSTableView *favouritesTable;
    NSMutableArray *favouritesData;
}

//@property NSArray *favouritesArray;

-(int)numberOfRowsInTableView:(NSTableView*) tableView;
-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(int)rowIndex;
-(void)pushFavouritesArray:(NSMutableArray *)array;
@end
