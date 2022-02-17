//
//  ViewController.h
//  volumeControl
//
//  Created by Tom Ihara on 2022/02/16.
//

#import <UIKit/UIKit.h>
#import "sliderView.h"


@interface ViewController : UIViewController<sliderViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *button1;


@end

