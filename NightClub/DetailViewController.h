//
//  DetailViewController.h
//  NightClub
//
//  Created by itisioslab on 06.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *MyName;
@property (weak, nonatomic) IBOutlet UILabel *MyAge;
@property (weak, nonatomic) IBOutlet UILabel *MySkill;

@property (strong, nonatomic) Person *person;



@end
