//
//  CoverPageViewController.m
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/7/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "CoverPageViewController.h"

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

@end
