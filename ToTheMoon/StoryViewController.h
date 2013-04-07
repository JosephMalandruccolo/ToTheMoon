//
//  StoryViewController.h
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/5/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageViewController.h"
#import "HeroPageViewController.h"
#import "CoverPageViewController.h"



@interface StoryViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) NSMutableArray *storyData;
@property (strong, nonatomic) UIPageViewController *pageVC;




@end
