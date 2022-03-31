//
//  Singleton.m
//  Test
//
//  Created by swj on 2022/3/30.
//

#import "Singleton.h"

@implementation Singleton

static id  instance ;

+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
//    static Singleton *instance = nil;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    return  instance;
}
+(id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
//    static Singleton *instance = nil;
    dispatch_once(&onceToken, ^{
        if (!instance) {
            instance = [super allocWithZone:zone];
        }
    });
    return instance;
}
-(id)copyWithZone:(NSZone*)zone
{
    return instance;
    
}
@end
