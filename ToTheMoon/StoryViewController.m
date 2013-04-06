//
//  StoryViewController.m
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/5/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "StoryViewController.h"
#import "PageModel.h"
#import "StoryParser.h"

@interface StoryViewController ()

@end

@implementation StoryViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [self loadStory];
}



//####################################################################################
// *   @abstract            create PageModel instances by reading from an XML file
// *   @description
//####################################################################################
- (void)loadStory
{
    //prepare the data to be parsed
    NSString *xmlFileName = [[NSBundle mainBundle] pathForResource:@"storyContents" ofType:@"xml"];
    NSLog(@"Will parse file with name: %@", xmlFileName);
    NSData *data = [NSData dataWithContentsOfFile:xmlFileName];
    
    //prepare the parsers
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    StoryParser *storyParser = [[StoryParser alloc] init];
    [parser setDelegate:storyParser];
    
    //start parsing!
    NSLog(@"Starting to parse");
    BOOL success = [parser parse];
    
    
    if (success) {
        
        NSLog(@"Parsing succeeded");
        _storyData = [storyParser pages];
        
        //this code is for testing purposes
        NSLog(@"%lu pages added to StoryViewController", (unsigned long)[self.storyData count]);
        PageModel *firstPage = [self.storyData objectAtIndex:0];
        NSString *header = firstPage.header;
        NSLog(@"First page header: %@", header);
    }
    else
    {
        NSLog(@"Parsing failed");
    }
    
}




@end
