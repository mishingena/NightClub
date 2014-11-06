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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startGame {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //[[MySingleton sharedInstance].people addObjectsFromArray:[userDefaults objectForKey:@"people"]];
    //NSLog(@"%lu", (unsigned long)[MySingleton sharedInstance].people.count);
    //people = [userDefaults objectForKey:@"people"];
}

@end
