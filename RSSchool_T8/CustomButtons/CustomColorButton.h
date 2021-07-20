//
//  CustomColorButton.h
//  RSSchool_T8
//
//  Created by Vitaly Nabarouski on 7/19/21.
//

#import <UIKit/UIKit.h>
#import "PaintingState.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomColorButton : UIView

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, copy, nonnull) void (^selectButtonCallBack)(BOOL, UIColor *color);
@property (nonatomic, assign) BOOL isSelected;



@end

NS_ASSUME_NONNULL_END
