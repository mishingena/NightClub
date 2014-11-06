//
//  MySingleton.h
//  NightClub
//
//  Created by itisioslab on 06.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject

@property NSMutableArray *people;

+ (MySingleton *) sharedInstance;

@end
