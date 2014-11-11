//
//  Person.m
//  NightClub
//
//  Created by itisioslab on 06.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize name, age, movements;

- (void)initWithName:(NSString *)_name Age:(NSInteger)_age{
    name = _name;
    age = _age;
}

@end
