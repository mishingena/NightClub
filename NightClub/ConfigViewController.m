//
//  ConfigViewController.m
//  NightClub
//
//  Created by itisioslab on 05.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "ConfigViewController.h"

@interface ConfigViewController ()


@end

@implementation ConfigViewController
@synthesize pickerView;
@synthesize dataSource;
@synthesize ageTextField;
@synthesize nameTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = [NSArray arrayWithObjects:
                       @"Rnb",
                       @"Electrodance",
                       @"Pop",
                       @"None",
                       nil];
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
    return dataSource.count;
}

- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [dataSource objectAtIndex:row];
}

-(BOOL) check {
    if (![nameTextField.text isEqual:@"" ] && ![ageTextField.text isEqual:@""] && [ageTextField.text integerValue] > 17) return YES;
    if ([nameTextField.text isEqual:@"" ] || [ageTextField.text isEqual:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ошибка"
                                                        message:[NSString stringWithFormat:@"Не все поля заполнены"]
                                                       delegate:self
                                              cancelButtonTitle:@"ОК"
                                              otherButtonTitles:nil];
        
        [alert show];
    } else {
        if ([ageTextField.text integerValue] < 18) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ошибка"
                                                        message:[NSString stringWithFormat:@"Извините, вход в наш клуб только с 18 лет"]
                                                       delegate:self
                                              cancelButtonTitle:@"ОК"
                                              otherButtonTitles:nil];
        
        [alert show];
        }
    }
    return NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
 //   [self donePressed];
}

- (IBAction)donePressed {
    
    if ([self check]) {
        [[MySingleton sharedInstance].people addObject:nameTextField.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}


@end
