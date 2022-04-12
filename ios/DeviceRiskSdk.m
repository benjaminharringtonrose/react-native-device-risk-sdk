#import "DeviceRiskSdk.h"
#import "Frameworks/FraudForce/FraudForce.xcframework/ios-arm64/FraudForce.framework/Headers/FraudForce.h"

@implementation DeviceRiskSdk

RCT_EXPORT_MODULE()

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
RCT_REMAP_METHOD(multiply,
                 multiplyWithA:(nonnull NSNumber*)a withB:(nonnull NSNumber*)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
  NSNumber *result = @([a floatValue] * [b floatValue]);

  resolve(result);
}

RCT_EXPORT_METHOD(getBlackboxId:(RCTResponseSenderBlock)callback){
 @try{
     NSString *blackbox = [FraudForce blackbox];
   callback(@[[NSNull null], blackbox]);
 }
 @catch(NSException *exception){
   callback(@[exception.reason, [NSNull null]]);
 }
}

@end

