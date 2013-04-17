//
//  CoverPageViewController.h
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/7/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageViewController.h"

@interface CoverPageViewController : PageViewController

@property (weak, nonatomic) IBOutlet UILabel *storyTitle;
@property (weak, nonatomic) IBOutlet UILabel *storySubtitle;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UIImageView *creditsImageView;

- (IBAction)goToCreditsBtn:(id)sender;

@end
