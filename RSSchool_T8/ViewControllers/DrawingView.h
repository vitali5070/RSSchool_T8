//
//  DrawingView.h
//  RSSchool_T8
//
//  Created by Vitaly Nabarouski on 7/20/21.
//

#import <UIKit/UIKit.h>
#import "PaintingState.h"

NS_ASSUME_NONNULL_BEGIN

@interface DrawingView : UIView
- (instancetype)initWithState:(PaintingState *) state;
@end

NS_ASSUME_NONNULL_END
