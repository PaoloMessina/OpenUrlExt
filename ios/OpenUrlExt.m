
/********* OpenUrl.m Cordova Plugin Implementation *******/

#import "OpenUrlExt.h"
#import <Cordova/CDV.h>

@implementation OpenUrlExt


-(void)launchUrl:(NSString*)urlString CDVcommand:(CDVInvokedUrlCommand*)command {
    NSURL *url = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success){
        CDVPluginResult* pluginResult;
        if (success) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                             messageAsString:[NSString stringWithFormat:@"Success: %@ opened",urlString]];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                             messageAsString:[NSString stringWithFormat:@"Failure: %@ not opened",urlString]];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    }];
}

- (void)open:(CDVInvokedUrlCommand*)command
{
    NSString *urlString = [command.arguments objectAtIndex:0];

    if (urlString != nil && [urlString length] > 0) {
        NSURL *url = [NSURL URLWithString:urlString];
//        bool canOpen = [[UIApplication sharedApplication] canOpenURL:url];
//        if (canOpen) {
            [self launchUrl:urlString CDVcommand:command];
//        } else {
//            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
//                                                              messageAsString:[NSString stringWithFormat:@"Failure: %@ not available",urlString]];
//            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
//        }
    } else {
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                         messageAsString:@"No URL given"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

@end