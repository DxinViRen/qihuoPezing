//
//  PlaymVC.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/18.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "PlaymVC.h"
#import <AVFoundation/AVFoundation.h>
@interface PlaymVC ()<AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lenLabel;
@property (weak, nonatomic) IBOutlet UILabel *golLabel;
@property (weak, nonatomic) IBOutlet UIImageView *MainImageView;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (nonatomic,strong)AVAudioPlayer *palyer;
@property (nonatomic,assign)BOOL isClick;

@end

@implementation PlaymVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.isClick  = NO;
    self.lenLabel.text = [NSString stringWithFormat:@"%@",self.model.haveLe];
    self.golLabel.text = self.model.gol;
     AVAudioSession * session = [AVAudioSession sharedInstance];
      [session setActive:YES error:nil];
      [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    NSURL *path = [[NSBundle mainBundle] URLForResource:self.model.mp3 withExtension:@"mp3"];
    NSData *data = [NSData dataWithContentsOfURL:path];
   [self.playBtn setBackgroundImage:[UIImage imageNamed:@"platbbtn"] forState:UIControlStateNormal];
    NSError *err = nil;
    self.palyer = [[AVAudioPlayer alloc]initWithData:data error:&err];
    NSLog(@"%@",err);
    self.palyer.delegate = self;
    [self.palyer prepareToPlay];
    self.MainImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.MainImageView sd_setImageWithURL:[NSURL URLWithString:self.model.larImg]];
}
- (IBAction)playBtnAction:(id)sender {
    if(!self.isClick){
        [self.palyer play];
        [self.playBtn setBackgroundImage:[UIImage imageNamed:@"pausttn"] forState:UIControlStateNormal];
        [self.playBtn setTitleColor:MainColor forState:UIControlStateNormal];

    }else{
       
        [self.playBtn setBackgroundImage:[UIImage imageNamed:@"platbbtn"] forState:UIControlStateNormal];
        [self.playBtn setTitleColor:MainColor forState:UIControlStateNormal];

        [self.palyer pause];
    }
    
    self.isClick  =  !self.isClick;
}


-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    
}// 音频播放完成
-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{
    
} //
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
