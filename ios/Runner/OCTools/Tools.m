//
//  CommonTools.m
//  ScenicNav
//
//  Created by laoK on 2019/1/10.
//  Copyright © 2019 xhkj. All rights reserved.
//

#import "Tools.h"
#import "AFNetworking.h" 
#import <UserNotifications/UserNotifications.h>
 
@implementation Tools

+ (BOOL)isBlankString:(NSString *)aStr {
    if (!aStr) {
        return YES;
    }
    if ([aStr isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (!aStr.length) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (![jsonString isKindOfClass:[NSString class]]) {
        return nil;
    }
    if (jsonString == nil) {
        return nil;
    }
    if ([Tools isBlankString:jsonString]) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        return nil;
    }
    return dic;
}
 
@end
