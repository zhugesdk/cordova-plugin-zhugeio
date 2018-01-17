//
//  CDVZhugeio.m
//  HelloCordova
//
//  Created by Jiaokang  on 15/01/2018.
//
//

#import "CDVZhugeio.h"
#import "Zhuge.h"

@implementation CDVZhugeio

-(void)pluginInitialize{
    NSLog(@"CDVZhugeio pluginInitialize");
    NSString* apiKey = [self.commandDelegate.settings objectForKey:[@"ZHUGE_APP_KEY" lowercaseString]];
    NSLog(@"APP KEY is %@",apiKey);
    [[Zhuge sharedInstance]startWithAppKey:apiKey launchOptions:nil];
}

-(void)track:(CDVInvokedUrlCommand *)command{
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    if (args.count == 0) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event name"];
        return;
    }
    NSLog(@"CDVZhugeio track with %@ %@",[command argumentAtIndex:0],[command argumentAtIndex:1]);
    [[Zhuge sharedInstance] track:[command argumentAtIndex:0] properties:[command argumentAtIndex:1]];
    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
-(void)setUploadURL:(CDVInvokedUrlCommand *)command{
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    if (args.count == 0) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass upload url"];
        return;
    }
    NSLog(@"CDVZhugeio seturl with %@ %@",[command argumentAtIndex:0],[command argumentAtIndex:1]);
    id first = [command argumentAtIndex:0];
    id second = [command argumentAtIndex:1];
    [[Zhuge sharedInstance] setUploadURL:first andBackupUrl:second];
    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
-(void)startTrack:(CDVInvokedUrlCommand *)command{
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    if (args.count == 0) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event name"];
        return;
    }
    NSLog(@"CDVZhugeio start track with %@",[command argumentAtIndex:0]);
    id first = [command argumentAtIndex:0];
    [[Zhuge sharedInstance] startTrack:first];
    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
-(void)endTrack:(CDVInvokedUrlCommand *)command{
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    if (args.count == 0) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event name"];
        return;
    }
    NSLog(@"CDVZhugeio endTrack with %@ %@",[command argumentAtIndex:0],[command argumentAtIndex:1]);
    id first = [command argumentAtIndex:0];
    id second = [command argumentAtIndex:1];
    [[Zhuge sharedInstance] endTrack:first properties:second];
    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
-(void)identify:(CDVInvokedUrlCommand *)command{
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    if (args.count == 0) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass uid"];
        return;
    }
    NSLog(@"CDVZhugeio identify with uid : %@ prop: %@",[command argumentAtIndex:0],[command argumentAtIndex:1]);
    id first = [command argumentAtIndex:0];
    id second = [command argumentAtIndex:1];
    [[Zhuge sharedInstance] identify:first properties:second];
    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
-(void)openLog:(CDVInvokedUrlCommand *)command{
    CDVPluginResult* result= nil;
    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
-(void)openDebug:(CDVInvokedUrlCommand *)command{
    CDVPluginResult* result= nil;
    NSLog(@"CDVZhugeio openDebug ");
    [[Zhuge sharedInstance].config setDebug:YES];
    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
@end