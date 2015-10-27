#import "CurrentRadioAccessTechnology.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation CurrentRadioAccessTechnology

- (void)isFast:(CDVInvokedUrlCommand*)command
{

    NSString* callbackId = [command callbackId];
    //NSString* name = [[command arguments] objectAtIndex:0];
    //NSString* msg = [NSString stringWithFormat: @"Hello, %@", name];

    CTTelephonyNetworkInfo *telephonyInfo = [CTTelephonyNetworkInfo new];
    NSLog(@"Current Radio Access Technology: %@", telephonyInfo.currentRadioAccessTechnology);
    [NSNotificationCenter.defaultCenter addObserverForName:CTRadioAccessTechnologyDidChangeNotification
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         NSLog(@"New Radio Access Technology: %@", telephonyInfo.currentRadioAccessTechnology);
     }];
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network" message: telephonyInfo.currentRadioAccessTechnology delegate:self cancelButtonTitle:@"Delete" otherButtonTitles:@"Cancel", nil];
    //[alert show];

    CDVPluginResult* result = [CDVPluginResult
                                   resultWithStatus:CDVCommandStatus_OK
                                   messageAsBool:[self isFastInternal:telephonyInfo.currentRadioAccessTechnology]];

    [self.commandDelegate sendPluginResult:result
                                    callbackId:callbackId];
}

- (BOOL)isFastInternal:(NSString*)radioAccessTechnology {
    if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyGPRS]) {
        return NO;
    } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyEdge]) {
        return NO;
    } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyWCDMA]) {
        return YES;
    } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyHSDPA]) {
        return YES;
    } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyHSUPA]) {
        return YES;
    } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMA1x]) {
        return NO;
    } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORev0]) {
        return YES;
    } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORevA]) {
        return YES;
    } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyCDMAEVDORevB]) {
        return YES;
    } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyeHRPD]) {
        return YES;
    } else if ([radioAccessTechnology isEqualToString:CTRadioAccessTechnologyLTE]) {
        return YES;
    }

    return YES;
}

@end
