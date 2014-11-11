//
//  Person.h
//  NightClub
//
//  Created by itisioslab on 06.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;
@property (strong, nonatomic) NSString *movements;

- (void)initWithName:(NSString *)_name Age:(NSInteger)_age;


@end
