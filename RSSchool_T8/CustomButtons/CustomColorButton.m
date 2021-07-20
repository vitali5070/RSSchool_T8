//
//  CustomColorButton.m
//  RSSchool_T8
//
//  Created by Vitaly Nabarouski on 7/19/21.
//

#import "CustomColorButton.h"
#import "PaletteViewController.h"

@interface CustomColorButton ()
@property (nonatomic, strong) UIView *colorView;
@property (nonatomic, strong) UIButton *button;
@end

@implementation CustomColorButton

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10.0;
        self.layer.borderWidth = 2.0;
        self.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.25].CGColor;
        self.colorView = [[UIView alloc] initWithFrame:CGRectMake(8.0, 8.0, 24.0, 24.0)];
        self.colorView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.colorView];
        self.colorView.layer.cornerRadius = 6.0;
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40.0, 40.0)];
        [self addSubview:self.button];
        self.button.backgroundColor = [UIColor clearColor];
        self.button.layer.cornerRadius = 10.0;
        [self.button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
        self.isSelected = NO;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:40.0].active = YES;
    [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:40.0].active = YES;
}

- (void)setColor:(UIColor *)color{
    self.colorView.backgroundColor = color;
    _color = color;
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    if (self.color) {
        if (isSelected) {
            [self selectButton];
        } else {
            [self deselectButton];
        }
    }
}

- (void)selectButton {
    self.selectButtonCallBack(YES, self.color);
    [UIView animateWithDuration:0.1 animations:^{
        self.colorView.frame = CGRectMake(2.0, 2.0, 36.0, 36.0);
        self.colorView.layer.cornerRadius = 8.0;
        [self layoutIfNeeded];
    }];
}

- (void)deselectButton {
    self.selectButtonCallBack(NO, self.color);
    [UIView animateWithDuration:0.1 animations:^{
        self.colorView.frame = CGRectMake(8.0, 8.0, 24.0, 24.0);
        self.colorView.layer.cornerRadius = 6.0;
        [self layoutIfNeeded];
    }];
}

- (void)buttonTapped {
    
    if (self.isSelected){
        self.isSelected = NO;
    } else {
        self.isSelected = YES;
    }
}
@end
