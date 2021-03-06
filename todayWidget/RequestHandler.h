//
//  GoogleRequest.h
//
//
//  Created by Mark Vasiv on 27/08/15.
//
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "Parser.h"
#import "../googleTranslateWidget/RequestReceiver.h"
#import "../KeyHandler.h"

@interface RequestHandler : NSObject <NSURLSessionDelegate, NSURLSessionDataDelegate, NSURLSessionTaskDelegate> {
    NSViewController *returnView;
}
@property NSString *requestType;
@property(weak) id<ResponseReceiver>delegate;
@property(readonly) NSURLSession *currentSession;
@property KeyHandler *keyHandler;
+(RequestHandler *)NewDictionaryRequest;
+(RequestHandler *)NewTranslateRequest;
-(void)performRequestForSourceLanguage:(NSString *)sLang TargetLanguage:(NSString *)tLang Text:(NSString *)inputText;
-(void)cancelCurrentSession;
@end


