//
//  GoogleRequest.m
//  
//
//  Created by Mark Vasiv on 27/08/15.
//
//

#import "GoogleRequest.h"

@implementation GoogleRequest

-(GoogleRequest *)init {
    NSArray *keys = @[@"English", @"Russian", @"Finnish", @"Ukrainian"];
    NSArray *values = @[@"en", @"ru", @"fi", @"uk"];
    _languagesMap=[NSDictionary dictionaryWithObjects:values forKeys:keys];
    return [super init];
}
-(void)sendRequestWithSourceLanguage:(NSString *)sLang TargetLanguage:(NSString *)tLang Text:(NSString *)inputText Sender:(id)sender {
    [self getDataFromUrlWithSourceLanguage:[_languagesMap valueForKey:sLang] TargetLanguage:[_languagesMap valueForKey:tLang] Text:inputText WithDelegate:sender];
}
- (void)getDataFromUrlWithSourceLanguage:(NSString *)SLanguage TargetLanguage:(NSString *)TLanguage Text:(NSString *)inputText WithDelegate:(NSObject<asynchronousRequests> *)delegate {

    //encode input
    NSString *escapedInput = [inputText stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    //prepare url
    NSString *urlString=[NSString stringWithFormat:@"%@%@%@%@%@%@",@"https://translate.googleapis.com/translate_a/single?client=gtx&ie=UTF-8&oe=UTF-8&sl=",SLanguage,@"&tl=",TLanguage,@"&dt=t&q=",escapedInput];
    NSURL *url=[NSURL URLWithString:urlString];
    
    //prepare request
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    //make asynchronous request
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *receivedData, NSError *error) {
        if (error)
        {
            //newWord=[NSString stringWithFormat:@"%@",error];
            
        }
        else
        {
            [delegate receivedResponseFromRequest:receivedData];
            
        }
    }];
    
}

@end


