//
//  MiSnapPlugin.m
//
//  Created by Runi Kovoor
//

#import "MiSnapPlugin.h"

@implementation MiSnapPlugin

- (void)cordovaCallMiSnap:(CDVInvokedUrlCommand *)command
{
    self.cmd=command;

    NSString* side = [command argumentAtIndex:0];
    
    MiSnapSDKViewController *mvc = (MiSnapSDKViewController *)[[UIStoryboard storyboardWithName:@"MiSnapUX2" bundle:nil] instantiateViewControllerWithIdentifier:@"MiSnapSDKViewControllerUX2"];
    mvc.delegate=self;
    if([side isEqualToString:@"CheckFront"])
    {
        [mvc setupMiSnapWithParams:[MiSnapSDKViewControllerUX2 defaultParametersForCheckFront]];
    }
    else if([side isEqualToString:@"CheckBack"])
    {
        [mvc setupMiSnapWithParams:[MiSnapSDKViewControllerUX2 defaultParametersForCheckBack]];
    }
    
    [self.viewController presentViewController:mvc animated:YES completion:nil];
}

#pragma mark -
#pragma mark MiSnap Delegate methods

-(void)miSnapCancelledWithResults:(NSDictionary *)results
{
    NSMutableDictionary* mibiDataAndImages= [[NSMutableDictionary alloc]init];
    [mibiDataAndImages setObject:@"Cancelled" forKey:@"MiSnapPluginResultCode"];
    
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:mibiDataAndImages];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.cmd.callbackId];
}

- (void)miSnapFinishedReturningEncodedImage:(NSString *)encodedImage originalImage:(UIImage *)image andResults:(NSDictionary *)results
{
    NSMutableDictionary* mibiDataAndImages= [[NSMutableDictionary alloc]init];
    [mibiDataAndImages setObject:encodedImage forKey:@"EncodedImage"];
    [mibiDataAndImages setObject:@"ImageCaptured" forKey:@"MiSnapPluginResultCode"];
    
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:mibiDataAndImages];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.cmd.callbackId];
}

@end
