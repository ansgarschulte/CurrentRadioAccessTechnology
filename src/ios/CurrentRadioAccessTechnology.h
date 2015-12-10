#import <Cordova/CDV.h>

@interface CurrentRadioAccessTechnology : CDVPlugin

- (void) isFast:(CDVInvokedUrlCommand*)command;
- (void) getTechnology:(CDVInvokedUrlCommand*)command;

@end
