//
//  ViewController.m
//  NightClub
//
//  Created by itisioslab on 05.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize title, begin;

- (void)viewDidLoad
{
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nightClub_main.png"]];
    
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    
    [super viewDidLoad];
    title.text = NSLocalizedString(@"Welcome to our club", nil);
    [begin setTitle:NSLocalizedString(@"Start", nil) forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)startGame {
    [Model gameStart];
}

@end
