//
//  ConfigViewController.h
//  NightClub
//
//  Created by itisioslab on 05.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "MySingleton.h"
#import "Person.h"

@interface ConfigViewController : ViewController <UIAlertViewDelegate ,UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSArray *dataSource;
@property (nonatomic, retain) IBOutlet UITextField *nameTextField;
@property (nonatomic, retain) IBOutlet UITextField *ageTextField;

- (BOOL) check;
- (IBAction)donePressed;

@end
