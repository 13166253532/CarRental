//
//  DSHttpMessageListCmd+Response.m
//  SQlDemo
//
//  Created by xiejiangbo on 2017/11/21.
//  Copyright © 2017年 yin chen. All rights reserved.
//

#import "DSHttpMessageListCmd+Response.h"
#import "JSONModel.h"
#import "DSHttpMessageListResult.h"

@protocol DSHttpMessageListItems;
@interface DSHttpMessageListItems : JSONModel
@property NSString<Optional>*org_name;
@property NSString<Optional>*org_id;
@end
@implementation DSHttpMessageListItems
@synthesize description;
@end

@protocol DSHttpCompanyListResultData;
@interface DSHttpCompanyListResultData : JSONModel
@property NSMutableArray<Optional,DSHttpMessageListItems>*companyList;
@end
@implementation DSHttpCompanyListResultData
@synthesize description;
@end

@protocol DSHttpMessageListResultData;
@interface DSHttpMessageListResultData : JSONModel
@property DSHttpCompanyListResultData *content;
@property NSString<Optional>*message;
@property NSString<Optional>*code;
@end
@implementation DSHttpMessageListResultData
@synthesize description;
@end


@interface DSHttpMessageListResult()
@property DSHttpMessageListResultData *data;
@end



@implementation DSHttpMessageListCmd (Response)
- (void)onRequestSuccess:(id)request code:(NSInteger)code{
    
    [self.result setResultState:kRequestResultSuccess];
    NSDictionary *dic = (NSDictionary *)request;
    DSHttpMessageListResult *result = (DSHttpMessageListResult *)self.result;
    if (code>199&&code<299) {
        [self.result setResultState:kRequestResultSuccess];
        NSError *error;
        result.data = [[DSHttpMessageListResultData alloc]initWithDictionary:dic error:(NSError **)&error];
        if(error){
            [self onRequestFailed:error];
            return;
        }
    }else{
        NSString *memo = [dic objectForKey:@"error_description"];
        [self.result setResultState:kRequestResultFail];
        [self.result setErrMsg:memo];
        NSLog(@"code :%ld errormsg:%@",(long)code,memo);
    }
}

- (void)onRequestFailed:(NSError *)error{
    NSLog(@"Error===%@",error);
    [self.result setErrMsg:[error localizedDescription]];
    [self.result setResultState:kRequestResultFail];
}

@end
@implementation DSHttpMessageListResult
- (NSMutableArray *)getTheAllData{
    NSMutableArray *array = [NSMutableArray array];
    
    
    return array;
}

@end
