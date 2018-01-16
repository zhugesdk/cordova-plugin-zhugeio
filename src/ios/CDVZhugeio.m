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

-(void)track:(CDVInvokedUrlCommand *)command{
    CDVPluginResult* result= nil;
    NSArray* args=command.arguments;
    if (args.count == 0) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"please pass event name"];
        return;
    }
    NSLog(@"HelloCordova track with %@ %@",[command argumentAtIndex:0],[command argumentAtIndex:1]);
    [[Zhuge sharedInstance] track:[command argumentAtIndex:0] properties:[command argumentAtIndex:1]];
    result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"success!"];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}
-(void)setUploadURL:(CDVInvokedUrlCommand *)command{

}
-(void)startTrack:(CDVInvokedUrlCommand *)command{

}
-(void)endTrack:(CDVInvokedUrlCommand *)command{

}
-(void)identify:(CDVInvokedUrlCommand *)command{

}
-(void)openLog:(CDVInvokedUrlCommand *)command{

}
-(void)openDebug:(CDVInvokedUrlCommand *)command{

}
@end