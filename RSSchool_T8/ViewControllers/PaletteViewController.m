//
//  PaletteViewController.m
//  RSSchool_T8
//
//  Created by Vitaly Nabarouski on 7/19/21.
//

#import "PaletteViewController.h"
#import "CustomColorButton.h"

@interface PaletteViewController ()

@property (nonatomic,strong) NSArray *colorArray;
@property (nonatomic,strong) NSMutableArray *selectedButtons;
@property (nonatomic,strong) NSMutableArray *paintingColors;
@property (strong, nonatomic) IBOutletCollection(CustomColorButton) NSArray<NSNumber *> *colorButtons;
@end

@implementation PaletteViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.curentState = [[PaintingState alloc]init];
    self.selectedButtons = [[NSMutableArray alloc]init];
    self.paintingColors = [[NSMutableArray alloc]init];
    self.colorArray = @[[UIColor colorNamed:@"Red"],
                        [UIColor colorNamed:@"Violet"],
                        [UIColor colorNamed:@"Green"],
                        [UIColor colorNamed:@"Grey"],
                        [UIColor colorNamed:@"Violet Light"],
                        [UIColor colorNamed:@"Peach"],
                        [UIColor colorNamed:@"Gold Yellow"],
                        [UIColor colorNamed:@"Blue Light"],
                        [UIColor colorNamed:@"Pink"],
                        [UIColor colorNamed:@"Dark Grey"],
                        [UIColor colorNamed:@"Dark Green"],
                        [UIColor colorNamed:@"Dark Red"]];
    [self configurePaletteView];

//    for (id familyName in [UIFont familyNames]) {
//        NSLog(@"%@", familyName);
//        for (id fontName in [UIFont fontNamesForFamilyName:familyName]) NSLog(@"  %@", fontName);
//    }

}


- (void)configurePaletteView {
   
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.cornerRadius = 50.0;
    self.view.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
    self.view.layer.shadowOffset = CGSizeZero;
    self.view.layer.shadowRadius = 8.0;
    self.view.layer.shadowOpacity = 0.25;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    for (int i = 0; i < self.colorArray.count; i++) {
        CustomColorButton *btn = [self.colorButtons objectAtIndex:i];
        btn.color = [self.colorArray objectAtIndex:i];
        btn.selectButtonCallBack = ^(BOOL isSelected, UIColor * _Nonnull color) {
//            self.view.backgroundColor = color;
            if (isSelected) {
                self.view.backgroundColor = color;
            }
            if (isSelected) {
                [self.selectedButtons addObject:@(i)];
                if (self.paintingColors.count < 4) {
                [self.paintingColors addObject:[self.colorArray objectAtIndex:i]];
                }
                self.curentState.colors = self.paintingColors;
                if (self.selectedButtons.count > 3) {
                    NSNumber *indexToDeselect = self.selectedButtons.firstObject;
                    CustomColorButton *btnToDeselect = [self.colorButtons objectAtIndex:indexToDeselect.integerValue];
                    btnToDeselect.isSelected = NO;
                    [self.paintingColors removeObjectAtIndex:0];
                    self.curentState.colors = self.paintingColors;
                }
            } else {
                [self.selectedButtons removeObjectAtIndex:0];
            }
        };
    };
}

- (void)configureTimerView {
    NSLog(@"Timer appended");
}

- (IBAction)saveButtonTaped:(id)sender {
    self.saveBlock(self.curentState);
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
