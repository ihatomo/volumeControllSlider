# volumeControllSlider

Like iPhone customized UIslider for volume controll.

How to use.
1) copy sliderView.h/m and Inport to your viewController
2) call initWithFrame
3) set deligate 
   -(void) sliderValueChanged : (NSInteger) value;
4) set Color
-(void) sliderColorChange : (BOOL) isColorDark;
5) set Initial Value
-(void) sliderValueSet : (NSInteger) value;
