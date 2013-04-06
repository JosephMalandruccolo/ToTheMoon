//
//  StoryParser.h
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/5/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PageModel.h"

@interface StoryParser : NSObject <NSXMLParserDelegate>

@property (strong, nonatomic) NSMutableArray *pages;
@property (strong, nonatomic) PageModel *page;
@property (strong, nonatomic) NSMutableString *currentElementValue;


extern NSString * const xml_class_node;
extern NSString * const xml_file_node;

@end
