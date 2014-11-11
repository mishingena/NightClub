//
//  MySingleton.m
//  NightClub
//
//  Created by itisioslab on 06.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "Singleton.h"

static Singleton* _sharedInstance;

@implementation Singleton

@synthesize people;


- (id)init {
    
    if (self = [super init]) {
        people = [NSMutableArray new];
    }
    return self;
}

+ (Singleton *) sharedInstance
{
    @synchronized(self)
    {
        if (!_sharedInstance)
        {
            _sharedInstance = [[Singleton alloc] init];
            
        }
    }
    
    return _sharedInstance;
}



@end
