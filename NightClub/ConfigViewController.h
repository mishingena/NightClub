//
//  ConfigViewController.h
//  NightClub
//
//  Created by itisioslab on 05.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "Singleton.h"
#import "Person.h"
#import "Model.h"

@interface ConfigViewController : ViewController <UIAlertViewDelegate ,UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic, retain) IBOutlet UITextField *nameTextField;
@property (nonatomic, retain) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UILabel *editNewPerson;
@property (weak, nonatomic) IBOutlet UITextView *textForPickerView;
@property (weak, nonatomic) IBOutlet UIButton *doneKey;

- (IBAction)donePressed;

@end
