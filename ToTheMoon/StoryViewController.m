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
    
    PageViewController *initialVC = [self viewControllerAtIndex:0];
    NSArray *vc = [NSArray arrayWithObject:initialVC];
    [self.pageVC setViewControllers:vc direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
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
// *   @abstract            returns the index of a given PageViewController
// *   @description
//####################################################################################
- (NSUInteger)indexOfViewController:(PageViewController *)viewController
{
    NSLog(@"calling indexOfViewController");
    return [self.storyData indexOfObject:viewController.model];

    
}



//####################################################################################
// *   @abstract            returns the proper PageViewController for a requested index
// *   @description
//####################################################################################
- (PageViewController *)viewControllerAtIndex:(NSUInteger)index
{
    
    NSLog(@"calling viewControllerAtIndex");
    if ((index >= [self.storyData count])) {
        return nil;
    }
    
    //instantiate the view controller to provide and feed it the appropriate model data
    //choose the Type of PageViewController to produce, based on the self.storyData.viewControllerClass, this is an intentional breach of MVC
    NSString *viewControllerClass = [[self.storyData objectAtIndex:index] viewControllerClass];
    
    
    if ([viewControllerClass isEqualToString:@"CoverPageViewController"]) {
        CoverPageViewController *dataSourceViewController = [[CoverPageViewController alloc] initWithNibName:@"CoverPageViewController" bundle:nil];
        dataSourceViewController.model = [self.storyData objectAtIndex:index];
        return dataSourceViewController;
    }
    else if ([viewControllerClass isEqualToString:@"HeroPageViewController"]) {
        HeroPageViewController *dataSourceViewController = [[HeroPageViewController alloc] initWithNibName:@"HeroPageViewController" bundle:nil];
        dataSourceViewController.model = [self.storyData objectAtIndex:index];
        return dataSourceViewController;
    }
    else if ([viewControllerClass isEqualToString:@"TallPageViewController"]) {
        TallPageViewController *dataSourceViewController = [[TallPageViewController alloc] initWithNibName:@"TallPageViewController" bundle:nil];
        dataSourceViewController.model = [self.storyData objectAtIndex:index];
        return dataSourceViewController;
    }
    else return nil;
    
}



#pragma mark - UIPageViewControllerDataSource delegate methods
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
    NSLog(@"Calling viewControllerBeforeViewController");
    NSUInteger index = [self indexOfViewController:(PageViewController*)viewController];
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
    
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
    NSLog(@"Calling viewControllerAfterViewController");
    if ([viewController isKindOfClass:[PageViewController class]]) {
        
        PageViewController *pvc = (PageViewController*)viewController;
        NSUInteger index = [self indexOfViewController:pvc];
        
        if (index == NSNotFound) {
            return nil;
        }
        
        index++;
        if (index == [self.storyData count]) {
            return nil;
        }
        
        return [self viewControllerAtIndex:index];
    }
    else {
        return nil;
    }
    
}


@end
