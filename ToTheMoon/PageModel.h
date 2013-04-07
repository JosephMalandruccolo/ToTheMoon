//
//  PageModel.h
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/5/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageModel : NSObject 

@property (strong, nonatomic) NSString *sequence;
@property (strong, nonatomic) NSString *viewControllerClass;    //this breaks the MVC boundary but is preferable to a massive set of if-statements
@property (strong, nonatomic) NSString *header;
@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSString *heroFilename;
@property (strong, nonatomic) NSString *backgroundFilename;

@end
