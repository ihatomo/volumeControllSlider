//
//  ViewController.m
//  volumeControl
//
//  Created by Tom Ihara on 2022/02/16.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *volumeLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *colorChangeController;
@property (strong, nonatomic) sliderView *sl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    NSLog (@"viewDidLoad");
    
    //set slider size
    float height = 35.0;
    float width = 150.0;
    CGRect frame = CGRectMake((self.view.frame.size.width - width)/2, self.view.frame.size.height-100,width,height);
    
    //add slider view
    _sl = [[sliderView alloc] initWithFrame:frame];
    [self.view addSubview:_sl];
    
    _sl.delegate = (id)self;
    
    //Recover recent volume value
    //initial value
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults setObject:@"10" forKey:@"volumeValue"];  //
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    //Set initial value
    [ud registerDefaults:defaults];
    NSInteger volumeValue = [ud integerForKey:@"volumeValue"];
    [_sl setSliderValue:volumeValue];
    
    //Label set
    _volumeLabel.text = [NSString stringWithFormat:@"%ld",_sl.sliderValue];
    
}



//Color Light/Dark Color Change

- (IBAction)colorChange:(UISegmentedControl *) sender {
    switch(sender.selectedSegmentIndex){
        case 0:
            self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
            _volumeLabel.textColor = [UIColor colorWithRed:0.11 green:0.11 blue:0.11 alpha:1.0];
            [_sl sliderColorChange :TRUE];
            break;
        case 1:
            self.view.backgroundColor = [UIColor colorWithRed:0.11 green:0.11 blue:0.11 alpha:1.0];
            _volumeLabel.textColor = [UIColor whiteColor];
            [_sl sliderColorChange: FALSE];
            break;
    }
    
}


//Delegate

-(void) sliderValueChanged : (NSInteger) sliderValue {
    _volumeLabel.text = [NSString stringWithFormat:@"%ld",sliderValue];
    
    //Record to userDefaults
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:sliderValue forKey:@"volumeValue"];


}


@end
