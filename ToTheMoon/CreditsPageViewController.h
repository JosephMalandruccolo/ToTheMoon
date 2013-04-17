//
//  CreditsPageViewController.h
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/16/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "PageViewController.h"

@interface CreditsPageViewController : PageViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *homeBtnView;


- (IBAction)homeBtn:(id)sender;


@end
