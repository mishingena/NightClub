//
//  MySingleton.h
//  NightClub
//
//  Created by itisioslab on 06.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

@property NSMutableArray *people;

+ (Singleton *) sharedInstance;

@end
