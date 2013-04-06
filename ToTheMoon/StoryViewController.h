//
//  StoryViewController.h
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/5/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroPageViewController.h"

@interface StoryViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) NSMutableArray *storyData;




@end
