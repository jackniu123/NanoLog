//
//  AppDelegate.m
//  testNanoLog_ios
//
//  Created by jackniu on 2020/5/4.
//  Copyright © 2020 kuaishou. All rights reserved.
//

#import "AppDelegate.h"

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

int __sub_main_(int argc, char** argv);
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// Override point for customization after application launch.
    __sub_main_(0, 0);
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
