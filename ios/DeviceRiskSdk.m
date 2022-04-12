#import "DeviceRiskSdk.h"
@import FraudForce;

@implementation DeviceRiskSdk

RCT_EXPORT_MODULE()

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

