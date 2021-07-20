//
//  PaintingState.m
//  RSSchool_T8
//
//  Created by Vitaly Nabarouski on 7/19/21.
//

#import "PaintingState.h"

@implementation PaintingState

- (instancetype)init
{
    self = [super init];
    if (self) {
        _colors = @[[UIColor blackColor],[UIColor blackColor],[UIColor blackColor]];
    }
    return self;
}

@end
