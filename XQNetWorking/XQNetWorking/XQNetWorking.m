//
//  XQNetWorking.m
//  XQNetWorking
//
//  Created by 周剑 on 16/3/27.
//  Copyright © 2016年 bukaopu. All rights reserved.
//

#import "XQNetWorking.h"
#import <AFNetworking.h>


static XQNetWorking *_shared = nil;
@implementation XQNetWorking

+ (instancetype)sharedNetworking {
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_shared) {
            _shared = [super allocWithZone:zone];
        }
    });
    return _shared;
}

- (void)GET:(NSString *)URLString params:(NSDictionary *)params progress:(void (^)(NSProgress *))down success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URLString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        if (down) {
            down(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

- (void)POST:(NSString *)URLString params:(NSDictionary *)params progress:(void (^)(NSProgress *))upload success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:URLString parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        if (upload) {
            upload(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

@end
