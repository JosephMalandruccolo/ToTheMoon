//
//  MassivePageViewController.m
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/8/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "MassivePageViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MassivePageViewController ()

@end

@implementation MassivePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    
    NSLog(@"MassivePageViewController viewWillAppear");
    self.progress.text = self.model.sequence;
    self.idea.text = self.model.header;
    self.storyText.text = self.model.body;
    self.massiveView.image = [UIImage imageNamed:self.model.heroFilename];
    
    if (self.model.imageToAnimate) {
        self.resourceToAnimate = self.model.imageToAnimate;
    }
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:self.model.backgroundFilename]];
        
    //add a drop shadow
    [self.massiveView.layer setCornerRadius:30.0f];
    [self.massiveView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.massiveView.layer setShadowOpacity:0.8];
    [self.massiveView.layer setShadowRadius:3.0];
    [self.massiveView.layer setShadowOffset:CGSizeMake(1.0, 5.0)];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    if (self.resourceToAnimate) {
        [self animateEarthToMoon];
    }
}


#pragma mark - animations
- (void) animateEarthToMoon
{
    CGRect container = CGRectMake(200, 580, 101, 101);
    UIImageView *spacecraft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.resourceToAnimate]];
    spacecraft.frame = container;
    
    [self.view addSubview:spacecraft];
    
    [UIView animateWithDuration:4.0 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         spacecraft.center = CGPointMake(570, 180);
                     } completion:^(BOOL completed){
                         NSLog(@"shuttle moved");
                     }];
}











@end
