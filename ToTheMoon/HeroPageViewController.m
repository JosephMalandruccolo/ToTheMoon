//
//  HeroPageViewController.m
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/5/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "HeroPageViewController.h"
#import "StoryViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface HeroPageViewController ()

@end

@implementation HeroPageViewController

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
    NSLog(@"HeroPageViewController viewWillAppear");
    self.progress.text = self.model.sequence;
    self.idea.text = self.model.header;
    self.storyText.text = self.model.body;
    self.heroView.image = [UIImage imageNamed:self.model.heroFilename];
    self.heroCaption.text = self.model.heroCaption;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:self.model.backgroundFilename]];
    
    //add a drop shadow to the hero image and home button
    [self.heroView.layer setCornerRadius:30.0f];
    [self.heroView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.heroView.layer setShadowOpacity:0.8];
    [self.heroView.layer setShadowRadius:3.0];
    [self.heroView.layer setShadowOffset:CGSizeMake(1.0, 5.0)];
    
    [self.returnHomeImageView.layer setCornerRadius:30.0f];
    [self.returnHomeImageView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.returnHomeImageView.layer setShadowOpacity:1.0];
    [self.returnHomeImageView.layer setShadowRadius:1.0];
    [self.returnHomeImageView.layer setShadowOffset:CGSizeMake(1.0, 3.0)];
}



- (IBAction)returnHomeBtn:(id)sender
{
    
    NSLog(@"returnHome btn tapped");
    
    
    
}



@end
