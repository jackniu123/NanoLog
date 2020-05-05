//
//  AppDelegate.m
//  testNanoLog_ios
//
//  Created by jackniu on 2020/5/4.
//  Copyright © 2020 kuaishou. All rights reserved.
//

#import "AppDelegate.h"
#define USE_OBIWAN
#ifdef USE_OBIWAN
#import "KMOLogConfig.h"
#import "KMOLoggerManager.h"
#endif

@interface TDDObj : NSObject
@end
@implementation TDDObj

+ (void)load {
    NSArray* tmpDirectory = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:NSTemporaryDirectory() error:NULL];
    for (NSString *file in tmpDirectory) {
        [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@%@", NSTemporaryDirectory(), file] error:NULL];
    }
}
@end

@interface AppDelegate ()

@end

@implementation AppDelegate

int     gettimeofday(struct timeval * __restrict, void * __restrict);
long getCurrentTime()
{
   struct timeval tv;
   gettimeofday(&tv,NULL);
   return tv.tv_sec * 1000 + tv.tv_usec / 1000;
}

const long long ROUNDS = 10000;

#if defined(USE_OBIWAN)
- (void) runBenchMarkForObiwan
{
    long start = 0; long end = 0;
    
    NSString *sid = @"test";
    KMOLogConfig *config = [KMOLogConfig alloc];
    // config.enableTestEnvironment = kKSUEnableTest;
    config.invalidTTY = true;
    [KMOLoggerManager.sharedManager startSessionWithConfig:config];
    DDLogVerbose(@"hello======");
    start = getCurrentTime();
    for (int i = 0; i < ROUNDS; i++)
    {
        DDLogError(@"hello======");
    }
    end = getCurrentTime();
    NSLog(@"runBenchMarkForObiwan: run %lld rounds consume %ld ms\n", ROUNDS
    , end - start);
    
    start = getCurrentTime();
    for (int i = 0; i < ROUNDS*1000; i++)
    {
        void runBenchMarkWithCPluss();
        runBenchMarkWithCPluss();
        //DDLogVerbose(@"hello======");
        //NANO_LOG(NOTICE, "on ios: Simple log message with 0 parameters");
    }
    end = getCurrentTime();
    NSLog(@"runBenchMarkForNanoLog: run %lld rounds consume %ld ms\n", ROUNDS*1000
    , end - start);
}
#endif

int __sub_main_(int argc, char** argv);
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// Override point for customization after application launch.
#if !defined(USE_OBIWAN)
    __sub_main_(0, 0);
#else
    [self runBenchMarkForObiwan];
#endif
    
return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
// Called when a new scene session is being created.
// Use this method to select a configuration to create the new scene with.
return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
// Called when the user discards a scene session.
// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
