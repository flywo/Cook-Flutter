//
//  CommonTools.h
//  ScenicNav
//
//  Created by laoK on 2019/1/10.
//  Copyright © 2019 xhkj. All rights reserved.
//

#import <Foundation/Foundation.h>
 
NS_ASSUME_NONNULL_BEGIN

@interface Tools : NSObject

//字符串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end

NS_ASSUME_NONNULL_END
