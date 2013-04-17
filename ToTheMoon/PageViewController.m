//
//  PageViewController.m
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/7/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "PageViewController.h"
#import "StoryViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

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
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)jumpToHome:(PageViewController*)controller
{
    UIViewController *parentVC = controller.parentViewController;
    StoryViewController *storyVC = (StoryViewController*)parentVC.parentViewController;
    UIPageViewController *pageVC = storyVC.pageVC;
    
    PageViewController *initialVC = [storyVC viewControllerAtIndex:0];
    NSArray *vc = [NSArray arrayWithObject:initialVC];
    [pageVC setViewControllers:vc direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}


- (void)jumpToCredits:(PageViewController*)controller
{
    UIViewController *parentVC = controller.parentViewController;
    StoryViewController *storyVC = (StoryViewController*)parentVC.parentViewController;
    UIPageViewController *pageVC = storyVC.pageVC;
    
    PageViewController *creditsVC = [storyVC viewControllerAtIndex:[storyVC.storyData count] - 1];
    NSArray *vc = [NSArray arrayWithObject:creditsVC];
    [pageVC setViewControllers:vc direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

@end
