//
//  MiSnapPlugin.h
//
//  Created by Runi Kovoor
//

#import <Cordova/CDV.h>
#import <MiSnapSDK/MiSnapSDK.h>
#import "MiSnapSDKViewController.h"
#import "MiSnapSDKViewControllerUX2.h"

@interface MiSnapPlugin : CDVPlugin<MiSnapViewControllerDelegate>

@property(nonatomic,retain) CDVInvokedUrlCommand* cmd;

- (void)cordovaCallMiSnap:(CDVInvokedUrlCommand *)command;

@end
