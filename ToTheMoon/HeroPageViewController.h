//
//  HeroPageViewController.h
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/5/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageModel.h"

@interface HeroPageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *progress;
@property (weak, nonatomic) IBOutlet UILabel *idea;
@property (weak, nonatomic) IBOutlet UILabel *storyText;
@property (weak, nonatomic) IBOutlet UIImageView *heroView;


@property (strong, nonatomic) PageModel *model;

@end
