//
//  AppDelegate.m
//  testAudio
//
//  Created by zhaoqihao on 14-9-5.
//  Copyright (c) 2014年 com.zhaoqihao. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self playAudio];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *viewController=[[UIViewController alloc]init];
    [self.window setRootViewController:viewController];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)playAudio
{
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: nil];
    // Activates the audio session.
    NSError *activationError = nil;
    [[AVAudioSession sharedInstance] setActive: YES error: &activationError];
    
    if (activationError) {
        NSLog(@"activ error");
    }
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"1973" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:soundFilePath];
    //alloc a new player
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    if (!audioPlayer) {
        NSLog(@"error");
    }
    //prepare and set delegate
    [audioPlayer prepareToPlay];
    [audioPlayer setDelegate:self];
    
    //play audio
    [audioPlayer play];
}

@end
