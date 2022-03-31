//
//  Son.m
//  Test
//
//  Created by swj on 2022/3/3.
//

#import "Son.h"

@implementation Son
//+ (void)load{
//   NSLog(@"%s",__func__);
//}
//+ (void)initialize{
////   [super initialize];
//   NSLog(@"%s %@",__func__,[self class]);
//}
- (instancetype)init{
   if (self = [super init]) {
       NSLog(@"%s",__func__);
   }
   return self;
}

@end
