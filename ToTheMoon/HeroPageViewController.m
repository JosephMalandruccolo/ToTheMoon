//
//  HeroPageViewController.m
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/5/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "HeroPageViewController.h"
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
    
    //add a drop shadow
    /*
    self.heroView.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.heroView.layer.shadowOffset = CGSizeMake(0, 1);
    self.heroView.layer.shadowOpacity = 1;
    self.heroView.layer.shadowRadius = 6.0;
    self.heroView.clipsToBounds = NO;
     */
    [self.heroView.layer setCornerRadius:30.0f];
    //[self.heroView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    //[self.heroView.layer setBorderWidth:1.5f];
    [self.heroView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.heroView.layer setShadowOpacity:0.8];
    [self.heroView.layer setShadowRadius:3.0];
    [self.heroView.layer setShadowOffset:CGSizeMake(1.0, 5.0)];
}


@end
