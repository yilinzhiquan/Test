//
//  ViewController.m
//  Test
//
//  Created by swj on 2022/3/3.
//

#import "ViewController.h"

#import "Person.h"
#import "Child.h"
#import "Son.h"
#import <sys/sysctl.h>
#import <mach/mach.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Person * a = [Person new];
    Person * b = [Person new];
    //    Child *c = [Child new];
    //    Child *d = [Child new];
    Son *e = [Son new];
    Son *f = [Son new];
    
    Person *p1 = [Person shareInstance];
    Person *p2 = [[Person alloc] init];
    Person *p3= [p1 copy];
//    NSLog(@"p1: %p ----p2:%p -----p3:%p",p1,p2,p3);
    Son *son1 = [Son shareInstance];
    Son *son2 = [[Son alloc] init];
    
    NSLog(@"\n p1 :%p\n p2 :%p\n p3 :%p \n son1:%p \n son2:%p ",p1,p2,p3,son1,son2);
    
    
    
    
    double avaliMemory = [self availableMemory];
    double useMemory = [self usedMemory];
    NSLog(@"avaliMemory---%fMB---useMemory---%fMB-",avaliMemory,useMemory);
    [self getMemory];
    
    NSArray *array = @[@2,@3,@4,@5,@6,@10,@13];
    [self twoSum:array target:19];
    
}
// 获取当前设备可用内存(单位：MB）
- (double)availableMemory
{
    
    vm_statistics_data_t vmStats;
       mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
       kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO,(host_info_t)&vmStats,&infoCount);
       
       if (kernReturn != KERN_SUCCESS) {
           return NSNotFound;
       }
       
       NSLog(@"%f",((vm_page_size *vmStats.free_count) / 1024.0) / 1024.0);
       
       return ((vm_page_size *vmStats.free_count) / 1024.0) / 1024.0;
    
}

// 获取当前任务所占用的内存（单位：MB）

- (double)usedMemory
{
    task_basic_info_data_t taskInfo;
    
    mach_msg_type_number_t infoCount =TASK_BASIC_INFO_COUNT;
    
    kern_return_t kernReturn =task_info(mach_task_self(),
                                        
                                        TASK_BASIC_INFO,
                                        
                                        (task_info_t)&taskInfo,
                                        
                                        &infoCount);
    if (kernReturn != KERN_SUCCESS
        
        ) {
        
        return NSNotFound;
    }
    
    return taskInfo.resident_size / 1024.0 / 1024.0;
}
-(void)getMemory
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *attributes = [fileManager attributesOfFileSystemForPath:NSHomeDirectory() error:nil];

    NSLog(@"容量%.2fG",[attributes[NSFileSystemSize] doubleValue] / (powf(1024, 3)));
    NSLog(@"可用%.2fG",[attributes[NSFileSystemFreeSize] doubleValue] / powf(1024, 3));
//    return [attributes[NSFileSystemSize] doubleValue] / (powf(1024, 3));
}
#pragma mark-  算法
/**
 *两数之和
 *给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
 *示例输入：nums = [3,2,4], target = 6  输出：[1,2]
 */
-(NSArray*)twoSum:(NSArray*)array target:(NSInteger)target
{
    NSArray *indexArray=nil;
    for (int i=0; i<array.count; i++) {
        for (int j=i+1; j<array.count; j++) {
            NSInteger first = [[array objectAtIndex:i] integerValue];
            NSInteger second = [[array objectAtIndex:j] integerValue];
            if (first+second == target) {
                indexArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:i],[NSNumber numberWithInt:j], nil];
                break;
            }
        }
    }
    NSLog(@"the index array %@",indexArray);
    return indexArray;
}
@end
