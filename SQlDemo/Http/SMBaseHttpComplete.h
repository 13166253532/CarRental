//
//  SMBaseHttpComplete.h
//  SQlDemo
//
//  Created by xiejiangbo on 2017/11/20.
//  Copyright © 2017年 yin chen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HttpCommandProtocol.h"

@class RequestResult;


typedef void (^SMHttpUIUpdateBlock)(RequestResult *,id);

@interface SMBaseHttpComplete : NSObject<HttpCommandCompleteDelegate>
//method
-(id) initWithBlock:(void(^)(RequestResult *,id userInfo))completeBlock withUserInfo:(id)userInfo;
-(void)updateUI:(RequestResult *)result;
//property
@property (copy) void (^completeBlock)(RequestResult *,id);
@end
