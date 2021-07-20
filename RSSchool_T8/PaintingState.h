//
//  PaintingState.h
//  RSSchool_T8
//
//  Created by Vitaly Nabarouski on 7/19/21.
//

#import <Foundation/Foundation.h>
#import "PaintingEnum.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PaintingState : NSObject

@property (nonatomic, strong) NSArray<UIColor *>  *colors;
@property (assign, nonatomic) NSTimeInterval time;
@property (nonatomic, assign) PaintingType paitingType;

@end

NS_ASSUME_NONNULL_END
