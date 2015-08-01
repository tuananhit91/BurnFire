//
//  ViewController.m
//  BurnFire
//
//  Created by admin on 7/28/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    AVAudioPlayer* player;
    UIImageView* fire;
}
@end

@implementation ViewController
- (void) loadView{
    [super loadView];
}
- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self burnFire];
    NSURL *urlSound= [[NSBundle mainBundle] URLForResource:@"campfire" withExtension:@"mp3"];
    [self soundCampFire:urlSound];
}

- (void) soundCampFire:(NSURL*) url{
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    player.numberOfLoops = -1;
    [player play];
}

- (void) burnFire{
    
    fire = [[UIImageView alloc] initWithFrame:self.view.bounds];
    NSMutableArray* images = [[NSMutableArray alloc] initWithCapacity:17];
    for (int i = 1; i < 18; i++) {
        NSString*fileName;
        if (i<10) {
            fileName = [NSString stringWithFormat:@"campFire0%d.gif", i];
        }else{
            fileName = [NSString stringWithFormat:@"campFire%d.gif", i];
        }
        [images addObject:[UIImage imageNamed:fileName]];
    }
    
    fire.animationImages = images;
    fire.animationDuration = 1;
    fire.animationRepeatCount = 0;
    [self.view addSubview:fire];
    [fire startAnimating];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
