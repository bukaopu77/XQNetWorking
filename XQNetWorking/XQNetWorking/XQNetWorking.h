//
//  XQNetWorking.h
//  XQNetWorking
//
//  Created by 周剑 on 16/3/27.
//  Copyright © 2016年 bukaopu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface XQNetWorking : NSObject

+ (instancetype)sharedNetworking;

- (void)GET:(NSString *)URLString params:(NSDictionary *)params progress:(void (^) (NSProgress *progress))down success:(void (^) (NSURLSessionDataTask *task, id responder))success failure:(void (^) (NSURLSessionDataTask *task, NSError *error))failure;

- (void)POST:(NSString *)URLString params:(NSDictionary *)params progress:(void (^) (NSProgress *progress))upload success:(void (^) (NSURLSessionDataTask *task, id responder))success failure:(void (^) (NSURLSessionDataTask *task, NSError *error))failure;

@end
