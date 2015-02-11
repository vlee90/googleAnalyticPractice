//
//  BlueViewController.m
//  googleAnalyticDemoApp
//
//  Created by Vincent Lee on 2/11/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "BlueViewController.h"


@interface BlueViewController ()

@property (strong, nonatomic) id<GAITracker> tracker;
@property (strong, nonatomic) NSNumber *itemPrice;

@end

@implementation BlueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenName = @"Blue Screen";
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipe];
    
    self.tracker = [[GAI sharedInstance] defaultTracker];
    
    self.itemPrice = [[NSNumber alloc] initWithInt:5];
}

-(IBAction)buyItemButtonPressed:(id)sender {
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ButtonPress" action:@"Buy" label:@"Item" value:self.itemPrice] build]];
}

-(void)swipeRight {
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Segue" action:@"Swipe Right" label:@"ToMainVC" value:nil] build]];
    [self performSegueWithIdentifier:@"segueToMainVC" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
