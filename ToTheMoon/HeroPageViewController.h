//
//  HeroPageViewController.h
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/5/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageModel.h"
#import "PageViewController.h"

@interface HeroPageViewController : PageViewController

@property (weak, nonatomic) IBOutlet UILabel *progress;
@property (weak, nonatomic) IBOutlet UILabel *idea;
@property (weak, nonatomic) IBOutlet UILabel *storyText;
@property (weak, nonatomic) IBOutlet UIImageView *heroView;
@property (weak, nonatomic) IBOutlet UILabel *heroCaption;
@property (weak, nonatomic) IBOutlet UIImageView *returnHomeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *playAudioImageView;


- (IBAction)returnHomeBtn:(id)sender;
- (IBAction)playAudioBtn:(id)sender;






@end
