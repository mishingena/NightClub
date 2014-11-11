//
//  ViewController.h
//  NightClub
//
//  Created by itisioslab on 05.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"
#import "Model.h"


@interface ViewController : UIViewController

-(IBAction)startGame;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIButton *begin;

@end
