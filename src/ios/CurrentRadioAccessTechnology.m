#import "CurrentRadioAccessTechnology.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation CurrentRadioAccessTechnology

- (void)isFast:(CDVInvokedUrlCommand*)command
{

    CTTelephonyNetworkInfo *telephonyInfo = [CTTelephonyNetworkInfo new];
    NSLog(@"Current Radio Access Technology: %@", telephonyInfo.currentRadioAccessTechnology);
    [NSNotificationCenter.defaultCenter addObserverForName:CTRadioAccessTechnologyDidChangeNotification
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         NSLog(@"New Radio Access Technology: %@", telephonyInfo.currentRadioAccessTechnology);
     }];

    NSString* callbackId = [command callbackId];

    NSNumber *isFastStatusBar =[self dataNetworkTypeFromStatusBar];

    //UIAlertView *alert3 = [[UIAlertView alloc] initWithTitle:@"Network Number" message: [isFastStatusBar stringValue] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Cancel", nil];
    //[alert3 show];

    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsBool:[self isFastInternal:[isFastStatusBar intValue]]];

    [self.commandDelegate sendPluginResult:result
                                callbackId:callbackId];
}

- (BOOL)isFastInternal:(int)type {
    BOOL returnValue = NO;
    if (type == 0) {//No wifi or cellular
        returnValue =  NO;
    } else if (type == 1) {//2G and earlier
        returnValue =  NO;
    } else if (type == 2) {//3G
        returnValue =  YES;
    } else if (type == 3) {//4G
        returnValue =  YES;
    } else if (type == 4) {//LTE
        returnValue =  YES;
    } else if (type == 5) {//Wifi
        returnValue =  YES;
    } else if (type == 6) {//Persönlicher Hotspot
        returnValue =  YES;
    } else if (type > 6){//Unkown
        returnValue =  YES;
    }

    return returnValue;
}

- (NSString*)getTechnologyInternal:(int)type {
    NSString* connectionString = @"No wifi or cellular";

    if (type == 1) {//2G and earlier
        connectionString = @"2G and earlier";
    } else if (type == 2) {//3G
        connectionString = @"3G";
    } else if (type == 3) {//4G
        connectionString = @"4G";
    } else if (type == 4) {//LTE
        connectionString = @"4G";
    } else if (type == 5) {//Wifi
        connectionString = @"Wifi";
    } else if (type == 6) {//Persönlicher Hotspot
        connectionString = @"Persönlicher Hotspot";
    } else if (type > 6){
        connectionString = @"Unkown";
    }

    return connectionString;
}


- (void)getTechnology:(CDVInvokedUrlCommand*)command
{
    NSString* callbackId = [command callbackId];

    NSNumber *isFastStatusBar =[self dataNetworkTypeFromStatusBar];

    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:[self getTechnologyInternal:[isFastStatusBar intValue]]];

    [self.commandDelegate sendPluginResult:result
                                callbackId:callbackId];
}


- (NSNumber *)dataNetworkTypeFromStatusBar {

    UIApplication *app = [UIApplication sharedApplication];
    NSArray *subviews = [[[app valueForKey:@"statusBar"] valueForKey:@"foregroundView"]    subviews];
    NSNumber *dataNetworkItemView = nil;

    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            dataNetworkItemView = subview;
            break;
        }
    }
    /* Where
     0 = No wifi or cellular
     1 = 2G and earlier
     2 = 3G
     3 = 4G
     4 = LTE
     5 = Wifi
     6 = Persönlicher Hotspot
     */

    return [dataNetworkItemView valueForKey:@"dataNetworkType"];
}


@end
