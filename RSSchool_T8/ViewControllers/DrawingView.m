//
//  DrawingView.m
//  RSSchool_T8
//
//  Created by Vitaly Nabarouski on 7/20/21.
//

#import "DrawingView.h"
#import <CoreGraphics/CoreGraphics.h>
@interface DrawingView ()
@property (nonatomic, strong) PaintingState *state;

@end
@implementation DrawingView


- (instancetype)initWithState:(PaintingState *) state
{
    self = [super init];
    if (self) {
        self.state = state;
    }
    return self;
}



- (void)drawRect:(CGRect)rect {
    NSArray *arr;
    switch (self.state.paitingType) {
        case treePaintingType:
            
        case headPaintingType:
            arr = @[@[@(CGPointMake(81.5,49)),@(CGPointMake(97,109)), @(CGPointMake(109,132)), @(CGPointMake(126.5,151.5)), @(CGPointMake(153.5,174)), @(CGPointMake(177,179.5)), @(CGPointMake(213,162))],

                             @[@(CGPointMake(204,120)),@(CGPointMake(195.5,118.5)), @(CGPointMake(186,120.5)), @(CGPointMake(178,121.5)), @(CGPointMake(168.5,120.5)), @(CGPointMake(160,119)), @(CGPointMake(153.5,118.5)),
                               @(CGPointMake(146,120)),@(CGPointMake(141.5,122)),@(CGPointMake(147.5,124.5)),@(CGPointMake(152,128)),@(CGPointMake(156.5,133)),@(CGPointMake(162.5,135.5)),@(CGPointMake(170,136.5)),@(CGPointMake(177,135.5)),@(CGPointMake(184.5,136.5)),@(CGPointMake(190.5,135.5)),@(CGPointMake(197,131.5)),@(CGPointMake(204,123.5)),@(CGPointMake(208.5,117.5)),@(CGPointMake(200.5,116.5)),@(CGPointMake(191.5,115.5)),@(CGPointMake(182.5,113.5)),@(CGPointMake(174,113)),@(CGPointMake(164,114.5)),@(CGPointMake(155,116.5)),@(CGPointMake(145,117.5)),@(CGPointMake(138,117)),@(CGPointMake(147.5,111)),@(CGPointMake(156.5,104.5)),@(CGPointMake(162.5,101)),@(CGPointMake(167.5,102.5)),@(CGPointMake(173,104.5)),@(CGPointMake(179.5,103.5)),@(CGPointMake(186,102.5)),@(CGPointMake(191.5,101.5)),@(CGPointMake(194.5,104.5)),@(CGPointMake(199.5,109.5)),@(CGPointMake(207,114))],

                    @[@(CGPointMake(214,128.5)),@(CGPointMake(216.5,135)), @(CGPointMake(213,144)), @(CGPointMake(206,152.5)), @(CGPointMake(197,159.5)), @(CGPointMake(187.5,152.5)), @(CGPointMake(177,148.5)),
                      @(CGPointMake(167.5,150)),@(CGPointMake(155.5,152.5)),@(CGPointMake(147.5,162)),@(CGPointMake(141,174.5)),@(CGPointMake(129.5,167.5)),@(CGPointMake(121.5,157.5)),@(CGPointMake(113,148.5)),@(CGPointMake(104.5,162)),@(CGPointMake(96.5,190.5)),@(CGPointMake(101.5,207.5)),@(CGPointMake(106,219)),@(CGPointMake(94.5,227.5)),@(CGPointMake(83.5,234.5)),@(CGPointMake(101,241)),@(CGPointMake(114.5,249.5)),@(CGPointMake(125,263.5)),@(CGPointMake(139,281)),@(CGPointMake(158,299)),@(CGPointMake(177,305.5)),@(CGPointMake(191,300)),@(CGPointMake(206,297.5)),@(CGPointMake(219.5,281)),@(CGPointMake(229.5,259.5)),@(CGPointMake(239,243.5)),@(CGPointMake(253.5,237)),@(CGPointMake(257,229)),@(CGPointMake(250.5,221.5)),@(CGPointMake(241,193)),@(CGPointMake(239,170)),@(CGPointMake(235,146.5)),@(CGPointMake(232,157.5)),@(CGPointMake(224,165.5)),@(CGPointMake(216.5,174.5)),@(CGPointMake(200,190.5)),@(CGPointMake(190,205)),@(CGPointMake(181.5,226.5)),@(CGPointMake(178.5,252.5)),@(CGPointMake(175,281)),@(CGPointMake(171.5,299))]
                    
            ];
            break;
            
        default:
            break;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    CGContextFillRect(context, rect);

    
    for (NSArray <NSNumber *> *arrA in arr ) {
        CGContextBeginPath(context);
        struct CGColor *color = self.state.colors[0].CGColor;
        CGContextSetStrokeColorWithColor(context, color);
        for (int i = 0; i < arrA.count; i++) {
            if (i == 0) {
                CGContextMoveToPoint(context, arrA[i].CGPointValue.x, arrA[i].CGPointValue.y);
            } else {
                CGContextAddLineToPoint(context, arrA[i].CGPointValue.x, arrA[i].CGPointValue.y);
                
            }
        }
        CGContextStrokePath(context);
    }
    


//    CGContextSetRGBStrokeColor(context, 0,0,0,1);
//    CGContextBeginPath(context);
//    CGContextMoveToPoint(context, 200, 200);
//    CGContextAddLineToPoint(context, 220, 230);
//    CGContextAddLineToPoint(context, 250, 250);
//    CGContextStrokePath(context);
//
//    struct CGColor *color = [UIColor redColor].CGColor;
//    CGContextSetStrokeColorWithColor(context, color);
//    CGContextBeginPath(context);
//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, 30, 30);
//    CGContextAddLineToPoint(context, 69, 69);
//    CGContextStrokePath(context);
//
//
//    struct CGColor *colorU = [UIColor blueColor].CGColor;
//    CGContextSetStrokeColorWithColor(context, colorU);
//    CGContextBeginPath(context);
//    CGContextMoveToPoint(context, 300, 0);
//    CGContextAddLineToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, 10, 10);
//    CGContextStrokePath(context);
////
////
////
////    [path moveToPoint:CGPointZero];
////    [path addLineToPoint:CGPointMake(30, 30)];
////    [path addLineToPoint:CGPointMake(100, 100)];
    
}
@end
