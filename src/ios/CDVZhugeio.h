//
//  CDVZhugeio.h
//  HelloCordova
//
//  Created by Jiaokang  on 15/01/2018.
//
//

#import <Cordova/CDVPlugin.h>
#import "Zhuge.h"

@interface CDVZhugeio : CDVPlugin

-(void)track:(CDVInvokedUrlCommand *)command;
-(void)setUploadURL:(CDVInvokedUrlCommand *)command;
-(void)startTrack:(CDVInvokedUrlCommand *)command;
-(void)endTrack:(CDVInvokedUrlCommand *)command;
-(void)identify:(CDVInvokedUrlCommand *)command;
-(void)openLog:(CDVInvokedUrlCommand *)command;
-(void)openDebug:(CDVInvokedUrlCommand *)command;
@end