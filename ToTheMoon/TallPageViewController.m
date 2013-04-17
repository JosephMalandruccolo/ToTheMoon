//
//  TallPageViewController.m
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/7/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "TallPageViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TallPageViewController ()

@end

@implementation TallPageViewController

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
    NSLog(@"TallPageViewController viewWillAppear");
    self.progress.text = self.model.sequence;
    self.idea.text = self.model.header;
    self.storyText.text = self.model.body;
    [self.storyText sizeToFit]; //to align vertical
    self.tallImage.image = [UIImage imageNamed:self.model.tallFilename];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:self.model.backgroundFilename]];
    
    //add a drop shadow
    /*
     self.heroView.layer.shadowColor = [UIColor whiteColor].CGColor;
     self.heroView.layer.shadowOffset = CGSizeMake(0, 1);
     self.heroView.layer.shadowOpacity = 1;
     self.heroView.layer.shadowRadius = 6.0;
     self.heroView.clipsToBounds = NO;
     */
    [self.tallImage.layer setCornerRadius:30.0f];
    //[self.heroView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    //[self.heroView.layer setBorderWidth:1.5f];
    [self.tallImage.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.tallImage.layer setShadowOpacity:0.8];
    [self.tallImage.layer setShadowRadius:3.0];
    [self.tallImage.layer setShadowOffset:CGSizeMake(1.0, 5.0)];
    
    [self.returnHomeImageView.layer setCornerRadius:30.0f];
    [self.returnHomeImageView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.returnHomeImageView.layer setShadowOpacity:1.0];
    [self.returnHomeImageView.layer setShadowRadius:1.0];
    [self.returnHomeImageView.layer setShadowOffset:CGSizeMake(1.0, 3.0)];
    
    [self.playAudioImageView.layer setCornerRadius:30.0f];
    [self.playAudioImageView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.playAudioImageView.layer setShadowOpacity:1.0];
    [self.playAudioImageView.layer setShadowRadius:1.0];
    [self.playAudioImageView.layer setShadowOffset:CGSizeMake(1.0, 3.0)];
    
    [self.hearRocketImageView.layer setCornerRadius:30.0f];
    [self.hearRocketImageView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.hearRocketImageView.layer setShadowOpacity:1.0];
    [self.hearRocketImageView.layer setShadowRadius:1.0];
    [self.hearRocketImageView.layer setShadowOffset:CGSizeMake(1.0, 3.0)];

}

- (IBAction)returnHomeBtn:(id)sender
{
    NSLog(@"returnHome btn tapped");
    [self jumpToHome:self];
}

- (IBAction)playAudioBtn:(id)sender
{
    NSLog(@"playAudioBtn tapped");
}

- (IBAction)hearRocketBtn:(id)sender
{
    NSLog(@"hearRocketBtn");
}
@end
