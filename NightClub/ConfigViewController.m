//
//  ConfigViewController.m
//  NightClub
//
//  Created by itisioslab on 05.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "ConfigViewController.h"
#import "Model.h"

@interface ConfigViewController ()


@end

@implementation ConfigViewController
@synthesize pickerView;
@synthesize ageTextField;
@synthesize nameTextField, editNewPerson, textForPickerView, doneKey;


- (void)viewDidLoad
{
    [super viewDidLoad];
    editNewPerson.text = NSLocalizedString(@"Add new person", nil);
    textForPickerView.text = NSLocalizedString(@"Choose what kind of music under your character can dance", nil);
    nameTextField.placeholder = NSLocalizedString(@"Enter your name", nil);
    ageTextField.placeholder = NSLocalizedString(@"Enter your age", nil);
    [doneKey setTitle:NSLocalizedString(@"Done", nil) forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.pickerView = nil;
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [Model getEnumCount];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    [Model setCurrentSkill:[Model getSkillAtIndex:row]];
    return [Model getStringValueOfSkillAtIndex:row];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
}

- (IBAction)donePressed {
    if ([Model checkNameField:nameTextField.text] && [Model checkAge:[ageTextField.text integerValue]]) {
        [Model addNewPersonWithName:nameTextField.text Age:[ageTextField.text integerValue]];
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end
