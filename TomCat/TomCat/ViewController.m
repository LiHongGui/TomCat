//
//  ViewController.m
//  TomCat
//
//  Created by lihonggui on 2016/12/13.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()<AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *eatButton;
@property(nonatomic,strong) AVAudioPlayer *audioPlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.audioPlayer.delegate = self;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self settingMp3:@"cat.mp3"];
    });
    
    NSLog(@"NSBundle%@",([NSBundle mainBundle].bundlePath));
}
- (IBAction)eat:(UIButton *)sender {
//    if (self.imageView.isAnimating) return;
//    self.mutbImage = [NSMutableArray array];
//    for (int i = 0; i < 40; i++) {
//        NSString *imageNamed = [NSString stringWithFormat:@"eat_%02d",i];
//        UIImage *image = [UIImage imageNamed:imageNamed];
//        self.imageView.image = image;
//        [self.mutbImage addObject:image];
//        
//    }
    [self imageNamed:@"eat" withCount:40];
    [self settingMp3:@"enemy7_down.mp3"];
   
    
  
//    self.imageView.animationImages = self.mutbImage;
//    self.imageView.animationDuration = 40*0.08;
//    self.imageView.animationRepeatCount = 1;
    
//    [self.imageView startAnimating];
//    //获取音效路径
//    NSURL *mp3URL = [[NSBundle mainBundle]URLForResource:@"enemy2_down.mp3" withExtension:nil];
//    //标记
//    SystemSoundID soundID = 1;
//    //加载音效
//    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(mp3URL), &soundID);
//    //播放音效
//    AudioServicesPlaySystemSound(soundID);
    
//    [self settingMp3:@"enemy2_down.mp3"];
//    NSString *string = [[NSBundle mainBundle] pathForResource:@"enemy4_down" ofType:@"mp3"];
//    NSURL *url = [NSURL fileURLWithPath:string];
//    NSError *err=nil;
//    _audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&err];
//    _audioPlayer.volume = 1;
//    [_audioPlayer prepareToPlay];
//    [_audioPlayer play];
//    if (err !=nil) {
//        
//         NSLog(@"%@",err);
//    }else {
//        NSLog(@"播放成功");
//    }
//    
//    if (_audioPlayer.isPlaying) {
//        return;
//    }

}
#pragma mark
#pragma mark -  设置音效
-(void)settingMp3:(NSString *)mp3
{
    /*******1******/
//    //获取路径
//    NSURL *url = [[NSBundle mainBundle]URLForResource:mp3 withExtension:nil];
//    //标记
//    SystemSoundID soundID = 1;
//    //加载
//    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &soundID);
//    if (!self.imageView.isAnimating) {
//        return;
//    }else {
//        //播放
//        AudioServicesPlaySystemSound(soundID);
//    }
    
    /*******2******/
    NSString *string = [[NSBundle mainBundle] pathForResource:mp3 ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:string];
    NSError *err=nil;
    _audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&err];
    _audioPlayer.volume = 1;
//    [_audioPlayer prepareToPlay];
    [_audioPlayer play];
    if (err !=nil) {
        
        NSLog(@"%@",err);
    }else {
        NSLog(@"播放成功");
    }
    
    
 
    
   
}

- (IBAction)fart:(UIButton *)sender {
    [self imageNamed:@"fart" withCount:28];
    
    [self settingMp3:@"enemy1_down.mp3"];
}
- (IBAction)drink:(UIButton *)sender {
    [self imageNamed:@"drink" withCount:81];
}
- (IBAction)scratch:(UIButton *)sender {
    [self imageNamed:@"scratch" withCount:56];
}

- (IBAction)pie:(UIButton *)sender {
    [self imageNamed:@"pie" withCount:24];
}
- (IBAction)cymbal:(UIButton *)sender {
    [self imageNamed:@"cymbal" withCount:13];
}
- (IBAction)Knockout:(UIButton *)sender {
    [self imageNamed:@"knockout" withCount:81];
}
- (IBAction)Angry:(UIButton *)sender {
    [self imageNamed:@"angry" withCount:26];
}
- (IBAction)Stomach:(UIButton *)sender {
    [self imageNamed:@"stomach" withCount:34];
}
- (IBAction)FootLeft:(UIButton *)sender {
    [self imageNamed:@"footLeft" withCount:30];
}
- (IBAction)FootRight:(UIButton *)sender {
    [self imageNamed:@"footRight" withCount:30];
}

-(void)imageNamed:(NSString *)imageNamed withCount:(int)count;
{
#warning UIImage *image = [UIImage imageNamed:imageString]加载的图片会保存在内存中,下次调用会很快启动,但是图片多的话就会影响内存
//        if (self.imageView.isAnimating) return;
//        NSMutableArray *mutb = [NSMutableArray array];
//        for (int i = 0; i < count; i++) {
//            NSString *imageString = [NSString stringWithFormat:@"%@_%02d",imageNamed,i];
//            UIImage *image = [UIImage imageNamed:imageString];
//            [mutb addObject:image];
//    
//        }
    
    
    if (self.imageView.isAnimating) return;
    NSMutableArray *mutb = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        NSString *imageString = [NSString stringWithFormat:@"%@_%02d.jpg",imageNamed,i];
        NSString *path = [[NSBundle mainBundle] pathForResource:imageString ofType:nil];
        UIImage *imageCat = [UIImage imageWithContentsOfFile:path];
        [mutb addObject:imageCat];
    }
    
    
    self.imageView.animationImages = mutb;
    self.imageView.animationDuration = self.imageView.animationImages.count*0.08;
    self.imageView.animationRepeatCount = 1;
    [self.imageView startAnimating];
    
    //动画结束后,删除图片
    /*******@property (nullable, nonatomic, copy) NSArray<UIImage *> *animationImages; // The array must contain UIImages. Setting hides the single image. default is nil
******/
    [self.imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.imageView.animationImages.count*0.08];
    
}

@end
