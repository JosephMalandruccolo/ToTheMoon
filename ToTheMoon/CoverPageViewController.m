//
//  CoverPageViewController.m
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/7/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "CoverPageViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface CoverPageViewController ()

@end

@implementation CoverPageViewController

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
    [self.creditsImageView.layer setCornerRadius:30.0f];
    [self.creditsImageView.layer setShadowColor:[UIColor grayColor].CGColor];
    [self.creditsImageView.layer setShadowOpacity:1.0];
    [self.creditsImageView.layer setShadowRadius:1.0];
    [self.creditsImageView.layer setShadowOffset:CGSizeMake(1.0, 3.0)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"CoverPageViewController viewWillAppear");
    UIColor *textColor = [UIColor whiteColor];
    
    
    self.storyTitle.text = self.model.header;
    self.storyTitle.textColor = textColor;
    
    self.storySubtitle.text = self.model.body;
    self.storySubtitle.textColor = textColor;
    
    self.author.text = self.model.authorCredit;
    self.author.textColor = textColor;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:self.model.backgroundFilename]];
}

- (IBAction)goToCreditsBtn:(id)sender
{
    [self jumpToCredits:self];
}
@end
