//
//  ArtistViewController.m
//  RSSchool_T8
//
//  Created by Vitaly Nabarouski on 7/19/21.
//

#import "ArtistViewController.h"
#import "CustomButton.h"
#import "PaintingState.h"
#import "PaletteViewController.h"
#import "RSSchool_T8-Swift.h"
#import "DrawingView.h"

@interface ArtistViewController ()
@property (weak, nonatomic) IBOutlet UIView *navigationBar;
@property (weak, nonatomic) IBOutlet UILabel *navigationTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *drawingsBarButton;
@property (weak, nonatomic) IBOutlet UIView *canvas;
@property (strong, nonatomic) IBOutletCollection(CustomButton) NSArray *actionButtons;
@property (weak, nonatomic) IBOutlet UIView *paletteView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *paletteViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *timerViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *drawingsViewTrailConstraint;
@property (nonatomic, strong) PaintingState *state;
@property (nonatomic, assign) BOOL isPaletteView;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    
}

- (void)configureView {
    // configure navigationBar
    self.navigationBar.layer.shadowOffset = CGSizeMake(0, 0);
    self.navigationBar.layer.shadowRadius = 0.5;
    self.navigationBar.layer.shadowColor = [UIColor blackColor].CGColor;
    self.navigationBar.layer.shadowOpacity = 0.3;
    // configure canvas
    self.canvas.layer.shadowOffset = CGSizeZero;
    self.canvas.layer.shadowRadius = 8.0;
    self.canvas.layer.shadowOpacity = 0.25;
    self.canvas.layer.shadowColor = [UIColor colorNamed:@"Chill Sky"].CGColor;
    self.canvas.backgroundColor = [UIColor whiteColor];
    self.canvas.layer.cornerRadius = 8.0;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[PaletteViewController class]]) {
        PaletteViewController *paletVC = segue.destinationViewController;
        __weak PaletteViewController *paletteView = paletVC;
        paletteView.saveBlock = ^void(PaintingState *state) {
            self.state = state;
            //hide paletteView
            [UIView animateWithDuration:0.2 animations:^{
                self.paletteViewHeightConstraint.constant = 333.5;
                [self.view layoutIfNeeded];
            }];
        };
    } else if ([segue.destinationViewController isKindOfClass:[TimerViewController class]]) {
        TimerViewController *timerVC = segue.destinationViewController;
        __weak TimerViewController *timerView = timerVC;
        timerView.saveCallback = ^(NSTimeInterval timeInterval) {
            self.state.time = timeInterval;
            [UIView animateWithDuration:0.2 animations:^{
                self.timerViewHeightConstraint.constant = -333.5;
                [self.view layoutIfNeeded];
            }];
        };
    }  else if ([segue.destinationViewController isKindOfClass:[DrawingsViewController class]]) {
        DrawingsViewController *drawingVC = segue.destinationViewController;
        __weak DrawingsViewController *drawingView = drawingVC;
        drawingView.enumCallback = ^(PaintingType paintingType) {
            if (paintingType != nonSelectedPaintingType) {
                self.state.paitingType = paintingType;
            }
            [UIView animateWithDuration:0.1 animations:^{
                self.drawingsViewTrailConstraint.constant = -375;
                [self.view layoutIfNeeded];
            }];
        };
    }
}

- (IBAction)showPaletteView:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.paletteViewHeightConstraint.constant = 0.5;
        [self.view layoutIfNeeded];
    }];
    
}

- (IBAction)showTimerView:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.timerViewHeightConstraint.constant = 0.5;
        [self.view layoutIfNeeded];
    }];
    
}

- (IBAction)showDrawingsView:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.drawingsViewTrailConstraint.constant = 0;
        [self.view layoutIfNeeded];
    }];
    
}

- (IBAction)drawButtonTapped:(id)sender {
    DrawingView *v = [[DrawingView alloc] initWithState:self.state];
    [self.canvas addSubview:v];
    v.frame = self.canvas.bounds;
}


@end
