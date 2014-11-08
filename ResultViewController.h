//
//  ResultViewController.h
//  NightClub
//
//  Created by itisioslab on 08.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "MySingleton.h"

@interface ResultViewController : UIViewController

@property (assign, nonatomic) BOOL isNowPlay;
@property (strong, nonatomic) NSString *genre;
@property (weak, nonatomic) IBOutlet UITextView *resultText;

@end
