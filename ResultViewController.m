//
//  ResultViewController.m
//  NightClub
//
//  Created by itisioslab on 08.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

@synthesize isNowPlay, genre, resultText;

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
    // Do any additional setup after loading the view.
    NSString *result = [NSString new];
    if ([MySingleton sharedInstance].people.count == 0) result = [NSString stringWithFormat:@"В клубе нет посетителей"];
    if (isNowPlay && !([MySingleton sharedInstance].people.count == 0)) {
        for (Person *person in [MySingleton sharedInstance].people) {
            if ([person.skill isEqualToString: genre]) {
                
                result = [NSString stringWithFormat: @"%@\n%@ танцует под %@", result, person.name, genre];
            } else result = [NSString stringWithFormat:@"%@\n%@ пьёт водку в баре", result, person.name];
        }
    } else if (!([MySingleton sharedInstance].people.count == 0)) {
        result = [NSString stringWithFormat:@"Сейчас в клубе не играет музыка"];
    }
    resultText.text = result;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
