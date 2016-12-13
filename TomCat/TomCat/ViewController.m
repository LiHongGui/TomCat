//
//  ViewController.m
//  TomCat
//
//  Created by lihonggui on 2016/12/13.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//@property(nonatomic,strong) NSMutableArray *mutbImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)imageNamed:(NSString *)imageNamed withCount:(NSInteger)count;
{
    #warning UIImage *image = [UIImage imageNamed:imageString]加载的图片会保存在内存中,下次调用会很快启动,但是图片多的话就会影响内存
//    if (self.imageView.isAnimating) return;
//    self.mutbImage = [NSMutableArray array];
//    for (int i = 0; i < count; i++) {
//        NSString *imageString = [NSString stringWithFormat:@"%@_%02d",imageNamed,i];
//        UIImage *image = [UIImage imageNamed:imageString];
//        self.imageView.image = image;
//        [self.mutbImage addObject:image];
//        
//    }
    if (self.imageView.isAnimating) return;
//    _mutbImage = [[NSMutableArray alloc]init];
    NSMutableArray *mutb = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        NSString *imageString = [NSString stringWithFormat:@"%@_%02d.jpg",imageNamed,i];
        NSString *path = [[NSBundle mainBundle] pathForResource:imageString ofType:nil];
        UIImage *imageCat = [UIImage imageWithContentsOfFile:path];
//        self.imageView.image = image;
        [mutb addObject:imageCat];
    }
    self.imageView.animationImages = mutb;
    self.imageView.animationDuration = self.imageView.animationImages.count*0.08;
    self.imageView.animationRepeatCount = 1;
     [self.imageView startAnimating];
    
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
//    self.imageView.animationImages = self.mutbImage;
//    self.imageView.animationDuration = 40*0.08;
//    self.imageView.animationRepeatCount = 1;
    
//    [self.imageView startAnimating];
    
}

- (IBAction)fart:(UIButton *)sender {
    [self imageNamed:@"fart" withCount:28];
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

-(void)dealloc
{
    
}
@end
