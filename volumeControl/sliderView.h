//
//  sliderView.h
//  volumeControl
//
//  Created by Tom Ihara on 2022/02/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol sliderViewDelegate <NSObject>

@optional
-(void) sliderValueChanged : (NSInteger) value;
@end

@interface sliderView : UIView
@property (weak, nonatomic) id <sliderViewDelegate> delegate;
@property NSInteger sliderValue;


-(void) sliderColorChange : (BOOL) isColorDark;
-(void) sliderValueSet : (NSInteger) value;

@end



NS_ASSUME_NONNULL_END
