//
//  HeroPageViewController.m
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/5/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "HeroPageViewController.h"

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:self.model.backgroundFilename]];
}


@end
