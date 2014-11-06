//
//  MySingleton.m
//  NightClub
//
//  Created by itisioslab on 06.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "MySingleton.h"

static MySingleton* _sharedInstance;

@implementation MySingleton

@synthesize people;


- (id)init {
    
    if (self = [super init]) {
        people = [NSMutableArray new];
    }
    return self;
}

+ (MySingleton *) sharedInstance
{
    @synchronized(self)
    {
        if (!_sharedInstance)
        {
            _sharedInstance = [[MySingleton alloc] init];
            
        }
    }
    
    return _sharedInstance;
}



@end
