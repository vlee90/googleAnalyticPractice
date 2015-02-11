//
//  ViewController.m
//  googleAnalyticDemoApp
//
//  Created by Vincent Lee on 2/10/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) id<GAITracker> tracker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenName = @"Main Screen";
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipe];
    
    self.tracker = [[GAI sharedInstance] defaultTracker];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

-(void)swipeLeft {
    [self.tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Segue" action:@"Swiped Left" label:@"ToBlueVC" value:nil] build]];
    [self performSegueWithIdentifier:@"segueToBlueVC" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
