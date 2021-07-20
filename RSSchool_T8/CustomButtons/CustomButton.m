//
//  CustomButton.m
//  RSSchool_T8
//
//  Created by Vitaly Nabarouski on 7/19/21.
//

#import "CustomButton.h"

@implementation CustomButton

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
        [self.titleLabel setFont:[UIFont fontWithName:@"Montserrat-Regular" size:18.0]];
        self.layer.cornerRadius = 10.0;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.shadowRadius = 2.0;
        self.layer.shadowOpacity = 0.25;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    if (selected) {
        self.layer.shadowOffset = CGSizeZero;
        self.layer.shadowOpacity = 1;
        self.layer.shadowRadius = 0.5;
        self.layer.shadowColor = [UIColor colorNamed:@"Light Green Sea"].CGColor;
    }
}


@end
