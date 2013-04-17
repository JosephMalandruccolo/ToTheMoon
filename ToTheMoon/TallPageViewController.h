//
//  TallPageViewController.h
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/7/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "PageViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface TallPageViewController : PageViewController

@property (weak, nonatomic) IBOutlet UILabel *progress;
@property (weak, nonatomic) IBOutlet UIImageView *tallImage;
@property (weak, nonatomic) IBOutlet UILabel *storyText;
@property (weak, nonatomic) IBOutlet UILabel *idea;
@property (weak, nonatomic) IBOutlet UIImageView *returnHomeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *playAudioImageView;
@property (weak, nonatomic) IBOutlet UIImageView *hearRocketImageView;

- (IBAction)returnHomeBtn:(id)sender;
- (IBAction)playAudioBtn:(id)sender;
- (IBAction)hearRocketBtn:(id)sender;


@end
