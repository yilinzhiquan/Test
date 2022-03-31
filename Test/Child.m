//
//  Child.m
//  Test
//
//  Created by swj on 2022/3/3.
//

#import "Child.h"

@implementation Child
static id  _instance ;

+(instancetype)shareInstance
{
    //    static Singleton *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_instance) {
            _instance = [[self alloc] init];
        }
    });
    return  _instance;
}
+(id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_instance) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}
-(id)copyWithZone:(NSZone*)zone
{
    return _instance;
    
}

+ (void)load{
   NSLog(@"%s",__func__);
}
+ (void)initialize{
   [super initialize];
   NSLog(@"%s %@",__func__,[self class]);
}
- (instancetype)init{
   if (self = [super init]) {
       NSLog(@"%s",__func__);
   }
   return self;
}

@end
