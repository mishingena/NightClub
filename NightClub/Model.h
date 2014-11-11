//
//  Model.h
//  NightClub
//
//  Created by itisioslab on 11.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Singleton.h"
#import "PersonWithRnbSkill.h"
#import "PersonWithPopSkill.h"
#import "PersonWithElectrodanceSkill.h"
#import <AVFoundation/AVFoundation.h>

typedef enum {
    Rnb,
    Pop,
    Electrodance,
    None,
} Skills;

@interface Model : NSObject

+ (void)gameStart;
+ (void)setCurrentSkill:(Skills)skill;
+ (void)setAudioPlayerWithSong:(NSString *)song;
+ (void)setVolume:(float)value;
+ (void)nextSong;
+ (void)previousSong;
+ (void)addNewPersonWithName:(NSString *)name Age:(NSInteger)age;

+ (NSString *)getNameOfPersonAtIndex:(NSInteger)position;
+ (NSString *)getSkillOfPerson:(Person *)person;
+ (NSString *)getNameOfMusic;
+ (NSString *)getGenreOfMusic;
+ (NSString *)startStop;
+ (NSString *)getReport;
+ (NSString *)getStringValueOfSkillAtIndex:(NSInteger)position;

+ (NSInteger)getEnumCount;

+ (Skills)getSkillAtIndex:(NSInteger)position;

+ (BOOL)checkAge:(NSInteger)age;
+ (BOOL)checkNameField:(NSString *)name;


@end
