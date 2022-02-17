//
//  sliderView.m
//  volumeControl
//
//  Created by Tom Ihara on 2022/02/16.
//

#import "sliderView.h"



@implementation sliderView

@synthesize sliderValue  = _sliderValue;

UIButton *bt;
UISlider *sl;

UIView *valueView;

UIImageView *iv;

UIImage *img0;
UIImage *img1;
UIImage *img2;
UIImage *img3;

UIColor *bgcolor;
UIColor *sliderColor;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame : (CGRect) frame {
    self = [super initWithFrame:frame];
    if (self){
        self.userInteractionEnabled = true;
        self.layer.cornerRadius = frame.size.width/12;
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = TRUE;

        //slider値 表示用のview貼り付け
        //このサイズ、現在のvolume値を復活させること
        valueView = [[UIView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height)];
        sliderColor = [UIColor whiteColor];
        valueView.backgroundColor = sliderColor;
        valueView.hidden = YES;
        [self addSubview:valueView];
        
        //image set
        [self sliderColorChange:TRUE];
        
        //img貼り付け ここも値を復活させる必要あり
        UIImage *image = [UIImage imageNamed:@"volume3.png"];
        iv = [[UIImageView alloc] initWithImage:image];
        iv.frame = CGRectMake(self.frame.size.width/2 - self.frame.size.height/2,5,frame.size.height-10,frame.size.height-10);
        [self addSubview:iv];
    }


    return self;
}


-(void)sliderColorChange : (BOOL) isColorDark {
    if (isColorDark){
        //image set
        img0 = [UIImage imageNamed:@"volume0"];
        img1 = [UIImage imageNamed:@"volume1"];
        img2 = [UIImage imageNamed:@"volume2"];
        img3 = [UIImage imageNamed:@"volume3"];
        bgcolor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
        sliderColor = [UIColor whiteColor];
    } else {
        //image set
        img0 = [UIImage imageNamed:@"volume0_w"];
        img1 = [UIImage imageNamed:@"volume1_w"];
        img2 = [UIImage imageNamed:@"volume2_w"];
        img3 = [UIImage imageNamed:@"volume3_w"];
        bgcolor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.0];
        sliderColor = [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.0];
    }
    valueView.backgroundColor = sliderColor;
    [self setVolumeImage:_sliderValue];
}

-(void) sliderValueSet:(NSInteger)value {
    _sliderValue = value;
    [self setVolumeImage:value];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog (@"Touch");
    self.backgroundColor = bgcolor;
    valueView.hidden = NO;
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint p = [[touches anyObject] locationInView:self];
    float x = p.x;    // X座標
    //float y = p.y;    // Y座標
    float max = self.frame.size.width;
    //枠外にSlideしたときの補正
    if (x < 0) {
        x = 0;
    } else if (x > max){
        x = max;
    }
    //スライダーの大きさ変更
    valueView.frame = CGRectMake(0,0,x,valueView.frame.size.height);
    
    //値を10段階に変換(0も入れたら11段階)
    NSInteger value = x/max * 10;
    
    //状況が変わったら画像を差し替える
    if (value != _sliderValue){
        [self setVolumeImage:value];
    }
    _sliderValue = value;
    [self.delegate sliderValueChanged:_sliderValue];

}

-(void)setVolumeImage : (NSInteger) value {
    if (value == 0){
        iv.image = img0;
    } else if (value >0 && value < 4){
        iv.image = img1;
    } else if (value >=4 && value < 7){
        iv.image = img2;
    } else if (value >=7){
        iv.image = img3;
    }
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.backgroundColor = [UIColor clearColor];
    valueView.hidden = YES;
}


@end
