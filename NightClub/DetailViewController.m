//
//  DetailViewController.m
//  NightClub
//
//  Created by itisioslab on 06.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize person;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.MyName.text = person.name;
    self.MyAge.text = [NSString stringWithFormat:@"%ld", (long)person.age];
    self.MySkill.text = [Model getSkillOfPerson:person];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
