//
//  PageViewController.h
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/7/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//
//  Abstract class that has a PageModel property

#import <UIKit/UIKit.h>
#import "PageModel.h"

@interface PageViewController : UIViewController

@property (strong, nonatomic) PageModel *model;

@end
