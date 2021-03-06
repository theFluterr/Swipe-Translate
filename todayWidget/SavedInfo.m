//
//  SavedInfo.m
//  googleTranslateWidget
//
//  Created by Mark Vasiv on 22/10/15.
//  Copyright © 2015 Mark Vasiv. All rights reserved.
//

#import "SavedInfo.h"

@implementation SavedInfo
+(SavedInfo *)localDefaults {
    SavedInfo *instance=[super new];
    [instance setUserDefaults:[NSUserDefaults standardUserDefaults]];
    [instance setType:@"local"];
    if([instance isEmpty])
        [instance createInitialDefaults];
    return instance;
}

-(void)createInitialDefaults {

        [self setInputText:@""];
        [self setOutputText:@""];
        [self setSourceLanguages:@[@"English",@"French",@"Spanish",@"Russian",@"Finnish"]];
        [self setTargetLanguages:@[@"French",@"Russian",@"English",@"Finnish",@"Spanish"]];
        [self setSourceSelection:@"English"];
        [self setTargetSelection:@"French"];
        [self setAutoLanguage:nil];

    
}
-(BOOL)isEmpty {

    if(![self hasLanguages]) {
        return YES;
    }
    else {
        for(int i=0;i<[[self targetLanguages] count];i++){
            if(![[NSArray getValuesArray:NO] containsObject:[self targetLanguages][i]])
                return YES;
        }
        for(int i=0;i<[[self sourceLanguages] count];i++){
            if(![[NSArray getValuesArray:NO] containsObject:[self sourceLanguages][i]])
                return YES;
        }
    }
    if(![self hasChosenLanguages])
        return YES;
    else {
        for(int i=0;i<[[self sourceLanguages] count];i++){
            if(![[NSArray getValuesArray:NO] containsObject:[self sourceSelection]])
                return YES;
        }
        for(int i=0;i<[[self targetLanguages] count];i++){
            if(![[NSArray getValuesArray:NO] containsObject:[self targetSelection]])
                return YES;
        }
    }

    return NO;
}
-(BOOL)hasLanguages {
    if([ self.userDefaults objectForKey:@"sourceDefault"]&&[[self userDefaults]objectForKey:@"targetDefault"])
    {
        if([[self.userDefaults objectForKey:@"sourceDefault"] count]==5&&[[self.userDefaults objectForKey:@"targetDefault"] count]==5)
            return YES;
        else
            return NO;
    }
    
    return NO;
}

-(BOOL)hasUsedSidebar {
    if ([self.userDefaults objectForKey:@"sidebarUsage"])
        return true;
    else
        return false;
}


-(BOOL)hasChosenLanguages {
    if([[self userDefaults]objectForKey:@"sourceDefaultSelection"]&&[[self userDefaults] objectForKey:@"targetDefaultSelection"]&&![[NSScanner scannerWithString:[[self userDefaults]stringForKey:@"sourceDefaultSelection"]]scanInt:nil]&&![[NSScanner scannerWithString:[[self userDefaults]stringForKey:@"targetDefaultSelection"]]scanInt:nil])
        return YES;
    return NO;
}
-(BOOL)hasDefaultText {
    if([[self userDefaults]objectForKey:@"defaultInput"]&&[[self userDefaults]objectForKey:@"defaultOutput"])
        return YES;
    return NO;
}
-(BOOL)hasAutoLanguage {
    if([[self userDefaults]objectForKey:@"autoLanguage"])
        return YES;
    return NO;
}

-(NSString *)inputText {
    return [[self userDefaults]stringForKey:@"defaultInput"];
}
-(NSString *)outputText {
     return [[self userDefaults]stringForKey:@"defaultOutput"];
}
-(NSArray *)sourceLanguages {
    return [[self userDefaults]arrayForKey:@"sourceDefault"];
}
-(NSArray *)targetLanguages {
    return [[self userDefaults]arrayForKey:@"targetDefault"];
}
-(NSString *)sourceSelection {
    return [[self userDefaults] objectForKey:@"sourceDefaultSelection"];
}
-(NSString *)targetSelection {
    return [[self userDefaults] objectForKey:@"targetDefaultSelection"];
}
-(NSString *)autoLanguage {
    return [[self userDefaults] stringForKey:@"autoLanguage"];
}
-(BOOL)autoPushed {
    return [[self userDefaults] boolForKey:@"autoPushed"];
}


-(void)setInputText:(NSString *)input {
    [[self userDefaults]setObject:input forKey:@"defaultInput"];
    [[self userDefaults] synchronize];
}
-(void)setOutputText:(NSString *)output {
    [[self userDefaults]setObject:output forKey:@"defaultOutput"];
    [[self userDefaults] synchronize];
}
-(void)setSourceLanguages:(NSArray *)array {
    [[self userDefaults]setObject:array forKey:@"sourceDefault"];
    [[self userDefaults] synchronize];
}
-(void)setTargetLanguages:(NSArray *)array {
    [[self userDefaults]setObject:array forKey:@"targetDefault"];
    [[self userDefaults] synchronize];
}
-(void)setSourceSelection:(NSString *)lang {
    [[self userDefaults] setObject:lang forKey:@"sourceDefaultSelection"];
    [[self userDefaults] synchronize];
}
-(void)setTargetSelection:(NSString *)lang {
    [[self userDefaults] setObject:lang forKey:@"targetDefaultSelection"];
    [[self userDefaults] synchronize];
}
-(void)setAutoLanguage:(NSString *)lang {
    [[self userDefaults] setObject:lang forKey:@"autoLanguage"];
}
-(void)setAutoPushed:(BOOL)value {
    [[self userDefaults] setBool:value forKey:@"autoPushed"];
}

-(void)setUsedSidebar:(BOOL)value {
    [[self userDefaults] setBool:value forKey:@"sidebarUsage"];
}

-(void)removeSidebarDefault {
    [[self userDefaults] removeObjectForKey:@"sidebarUsage"];
}

@end
