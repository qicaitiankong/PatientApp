//
//  LockTestViewController.m
//  PatientApp
//
//  Created by Lizihao Li on 2021/2/12.
//

#import "LockTestViewController.h"
#import <libkern/OSAtomic.h>
#import <os/lock.h>

#import <pthread.h>
@interface LockTestViewController ()
//@property (assign,nonatomic) os_unfair_lock mLock;
@end
@implementation LockTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self pthread_mute_recurisive];
//    [self NslockTest];
    //[self NSConditionTest];
    //[self synchronizedTest];
    //[self nsconditionLock];
    
 
}


- (void)dispatchSemphereTest{
    dispatch_semaphore_t signal = dispatch_semaphore_create(1); //传入值必须 >=0, 若传入为0则阻塞线程并等待overTime,时间到后会执行其后的语句
     //信号量设为1表示同一时间只能有一个线程访问资源，单纯使用信号量并不是保证有序，还和任务数量有关，只是控制资源的同一时间访问个数
     //线程1
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         NSLog(@"线程1 等待ing");
         dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER); //signal 值 -1
         NSLog(@"线程1");
         dispatch_semaphore_signal(signal); //signal 值 +1
         NSLog(@"线程1 发送信号");
         NSLog(@"--------------------------------------------------------");
     });

     //线程2
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         NSLog(@"线程2 等待ing");
         dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
         NSLog(@"线程2");
         dispatch_semaphore_signal(signal);
         NSLog(@"线程2 发送信号");
     });
     //线程3
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"线程3 等待ing");
            dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
            NSLog(@"线程3");
            dispatch_semaphore_signal(signal);
            NSLog(@"线程3 发送信号");
        });
     
     //线程4
           dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
               NSLog(@"线程4 等待ing");
               dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
               NSLog(@"线程4");
               dispatch_semaphore_signal(signal);
               NSLog(@"线程4 发送信号");
           });
     
}

- (void)nsconditionLock{
    NSConditionLock *lock = [[NSConditionLock alloc]initWithCondition:0];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       if ([lock tryLockWhenCondition:0])
       {
           NSLog(@"线程1");
           [lock unlockWithCondition:1];
       }else{
           NSLog(@"失败");
       }
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
       [lock lockWhenCondition:2];
       NSLog(@"线程2");
       [lock unlockWithCondition:1];
              
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        [lock lockWhenCondition:1];
        NSLog(@"线程3");
        [lock unlockWithCondition:2];
             
    });
    
}



- (void)synchronizedTest{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized (self) {
              sleep(2);
              NSLog(@"线程1");
          }
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       @synchronized (self) {
             NSLog(@"线程2");
         }
    });
    
    
}


//等待两秒执行
- (void)NSConditionTest{
    NSCondition *clock = [NSCondition new];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [clock lock];
        NSLog(@"线程1加锁成功");
        [clock wait];
        NSLog(@"线程1");
        [clock unlock];
        NSLog(@"线程1解锁成功");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [clock lock];
        NSLog(@"线程2加锁成功");
        [clock wait];
        NSLog(@"线程2");
        [clock unlock];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(2);
        NSLog(@"唤醒等待的线程");
        //唤醒一个等待的线程
        //[clock signal];
        //唤醒所有等待
        [clock broadcast];
    });
    
    
}


- (void)NslockTest{
    NSLock *lock = [NSLock new];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"线程1 尝试加锁");
        [lock lock];
        sleep(3);
        NSLog(@"线程1");
        [lock unlock];
        NSLog(@"线程1解锁成功");
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"线程2 尝试加锁");
        BOOL x = [lock lockBeforeDate:[NSDate dateWithTimeIntervalSinceNow:4]];
        if (x){
            NSLog(@"线程2");
            [lock unlock];
            NSLog(@"线程2解锁成功");
        }else{
            NSLog(@"失败");
        }
        
        
    });
    
    
}




- (void)pthread_mute_recurisive{
    static pthread_mutex_t plock;
       pthread_mutexattr_t attr;
       //初始化attr并且给他赋予默认
       pthread_mutexattr_init(&attr);
       //设置锁类型，这里设置递归锁
       pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
       pthread_mutex_init(&plock, &attr);
      // pthread_mutexattr_destroy(&attr);
       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           static void (^testRecurisive)(int);
           testRecurisive = ^(int num){
               pthread_mutex_lock(&plock);
               if (num > 0)
               {
                   NSLog(@"num=%d",num);
                   testRecurisive(num - 1 );
               }
               pthread_mutex_unlock(&plock);
           };
           testRecurisive(5);
       });
}

- (void)pthread_mutexTest{
    static pthread_mutex_t plock;
       pthread_mutex_init(&plock, NULL);
       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           NSLog(@"线程1 准备上锁");
           pthread_mutex_lock(&plock);
           sleep(3);
           NSLog(@"线程1");
           pthread_mutex_unlock(&plock);
       });
       
       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
              NSLog(@"线程2 准备上锁");
              pthread_mutex_lock(&plock);
              sleep(3);
              NSLog(@"线程2");
              pthread_mutex_unlock(&plock);
          });
}


- (void)OS_unfairTest{
//    self.mLock = OS_UNFAIR_LOCK_INIT;
//       NSInteger num = 100;
//       os_unfair_lock_lock(&_mLock);
//       num = 121;
//       NSLog(@"第一步：%ld",num);
//       os_unfair_lock_unlock(&_mLock);
//
//       os_unfair_lock_lock(&_mLock);
//       num = 126;
//       NSLog(@"第二步：%ld",num);
//       os_unfair_lock_unlock(&_mLock);
}

- (void)OSSpinLockTest{
    __block OSSpinLock oslock = OS_SPINLOCK_INIT;
       //线程1
       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           NSLog(@"线程1 准备上锁");
           OSSpinLockLock(&oslock);
           sleep(4);
           NSLog(@"线程1");
           OSSpinLockUnlock(&oslock);
           NSLog(@"线程1 解锁成功");
       });
       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
              NSLog(@"线程2 准备上锁");
              OSSpinLockLock(&oslock);
              NSLog(@"线程2");
              OSSpinLockUnlock(&oslock);
              NSLog(@"线程2 解锁成功");
          });
}

@end
