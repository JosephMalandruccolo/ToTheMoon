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
    
    
    NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey:UIPageViewControllerOptionSpineLocationKey];
    self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    
    self.pageVC.dataSource = self;
    [[self.pageVC view] setFrame:[[self view] bounds]];
    
    HeroPageViewController *initialVC = [self viewControllerAtIndex:0];
    
    NSLog(@"array with object");
    NSArray *vc = [NSArray arrayWithObject:initialVC];
    
    NSLog(@"setting viewControllers");
    [self.pageVC setViewControllers:vc direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    NSLog(@"adding views");
    [self addChildViewController:self.pageVC];
    [[self view] addSubview:[self.pageVC view]];
    [self.pageVC didMoveToParentViewController:self];
    
    
}







#pragma mark - private helpers
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


//####################################################################################
// *   @abstract            returns the index of a given HeroPageViewController
// *   @description
//####################################################################################
- (NSUInteger)indexOfViewController:(HeroPageViewController *)viewController
{
    return [self.storyData indexOfObject:viewController.model];
}



//####################################################################################
// *   @abstract            returns the proper view controller for a requested index
// *   @description
//####################################################################################
- (HeroPageViewController *)viewControllerAtIndex:(NSUInteger)index
{
    
    NSLog(@"calling viewControllerAtIndex");
    if ((index >= [self.storyData count])) {
        NSLog(@"viewControllerAtIndex returning nil");
        return nil;
    }
    
    //instantiate the view controller to provide and feed it the appropriate model data
    HeroPageViewController *dataSourceViewController = [[HeroPageViewController alloc] initWithNibName:@"HeroPageViewController" bundle:nil];
    dataSourceViewController.model = [self.storyData objectAtIndex:index];
    
    return dataSourceViewController;
    
}



#pragma mark - UIPageViewControllerDataSource delegate methods
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(HeroPageViewController*)viewController];
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
    
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(HeroPageViewController*)viewController];
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.storyData count]) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}




@end
