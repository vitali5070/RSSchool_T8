//
//  PaletteViewController.h
//  RSSchool_T8
//
//  Created by Vitaly Nabarouski on 7/19/21.
//

#import <UIKit/UIKit.h>
#import "PaintingState.h"


NS_ASSUME_NONNULL_BEGIN

@interface PaletteViewController : UIViewController
@property (nonatomic, strong) PaintingState *curentState;
@property (nonatomic, assign) BOOL isPaletteView;
@property (nonatomic, copy, nonnull) void (^saveBlock)(PaintingState *state);
@end

NS_ASSUME_NONNULL_END
