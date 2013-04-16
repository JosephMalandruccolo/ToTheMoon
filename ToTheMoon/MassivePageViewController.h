//
//  MassivePageViewController.h
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/8/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "PageViewController.h"

@interface MassivePageViewController : PageViewController

@property (weak, nonatomic) IBOutlet UILabel *progress;
@property (weak, nonatomic) IBOutlet UILabel *idea;
@property (weak, nonatomic) IBOutlet UIImageView *massiveView;
@property (weak, nonatomic) IBOutlet UILabel *storyText;

@property (weak, nonatomic) NSString *resourceToAnimate;

@end
