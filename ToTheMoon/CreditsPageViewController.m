//
//  CreditsPageViewController.m
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/16/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "CreditsPageViewController.h"
#import "CreditCell.h"
#import <QuartzCore/QuartzCore.h>

@interface CreditsPageViewController ()


@property (strong, nonatomic) NSArray * credits;
@property (weak, nonatomic) UITableViewCell * creditCell;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation CreditsPageViewController


#pragma mark - life cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadCredits];
    self.tableView.scrollEnabled = NO;
    self.tableView.allowsSelection = NO;
    [self.homeBtnView.layer setCornerRadius:30.0f];
    [self.homeBtnView.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.homeBtnView.layer setShadowOpacity:1.0];
    [self.homeBtnView.layer setShadowRadius:1.0];
    [self.homeBtnView.layer setShadowOffset:CGSizeMake(1.0, 3.0)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.credits count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"cellForRowAtIndexPath");
    static NSString *cellIdentifier = @"credit cell";
    
    CreditCell *cell = (CreditCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        UIViewController *temp = [[UIViewController alloc] initWithNibName:@"CreditCell" bundle:nil];
        cell = (CreditCell *)temp.view;
        
        NSDictionary *rowData = [self.credits objectAtIndex:indexPath.row];
        
        cell.nameLabel.text = [rowData objectForKey:@"NAME"];
        cell.roleLabel.text = [rowData objectForKey:@"ROLE"];
    }
    
    
    
    return cell;
    
}

#pragma mark - table view delegate
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Credits and Thanks!";
}


#pragma mark - private helpers
- (void)loadCredits
{
    NSDictionary *producer = [[NSDictionary alloc] initWithObjectsAndKeys:@"Joseph Malandruccolo", @"NAME", @"Executive Producer", @"ROLE", nil];
    NSDictionary *author = [[NSDictionary alloc] initWithObjectsAndKeys:@"Joseph Malandruccolo", @"NAME", @"Author", @"ROLE", nil];
    NSDictionary *developer = [[NSDictionary alloc] initWithObjectsAndKeys:@"Joseph Malandruccolo", @"NAME", @"Developer", @"ROLE", nil];
    NSDictionary *voice = [[NSDictionary alloc] initWithObjectsAndKeys:@"Joseph Malandruccolo", @"NAME", @"Voice Actor", @"ROLE", nil];
    NSDictionary *nouns = [[NSDictionary alloc] initWithObjectsAndKeys:@"The Noun Project", @"NAME", @"Home and Sound Icons", @"ROLE", nil];
    NSDictionary *nasa = [[NSDictionary alloc] initWithObjectsAndKeys:@"NASA", @"NAME", @"All Photographs", @"ROLE", nil];
    
    self.credits = [NSArray arrayWithObjects:producer, author, developer, voice, nouns, nasa, nil];
}

- (IBAction)homeBtn:(id)sender
{
    [self jumpToHome:self];
}
@end
