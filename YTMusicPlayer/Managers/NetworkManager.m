//
//  NetworkManager.m
//  YTMusicPlayer
//
//  Created by younggi.lee on 2022/09/27.
//

#import "NetworkManager.h"

@implementation NetworkManager

+ (instancetype)shared
{
    static NetworkManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[NetworkManager alloc] init];
    });
    return _sharedInstance;
}

@end
