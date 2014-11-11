//
//  Model.m
//  NightClub
//
//  Created by itisioslab on 11.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "Model.h"

@implementation Model

NSInteger enumCount;
Skills currentSkill;
NSInteger minAge;
AVAudioPlayer *audioPlayer;
BOOL isNowPlay;
NSInteger actualNumberOfSong;
NSArray *music;

+ (void)gameStart {
    enumCount = 4;
    minAge = 18;
    isNowPlay = NO;
    actualNumberOfSong = 0;
    
    music = [[NSArray alloc] initWithObjects:@"Blues - Velhas Virgens - Essa tal de tequila.mp3",
             @"Electrodance - Death Grips - Lord of the Game.mp3",
             @"Electrodance - The Echelon Effect - Your First Light My Eventide.mp3",
             @"Hip-Hop - Death Grips - Spread Eagle Cross the Block.mp3",
             @"Jazz - Gaba Kulka - Emily.mp3",
             @"Pop - Blackbird Blackbird - Left To Hurt.mp3",
             @"Pop - Flora Matos - Pretin.mp3",
             @"Rnb - Com Truise - Slow Peels.mp3", nil];
    [self setAudioPlayerWithSong:[music objectAtIndex:actualNumberOfSong]];
    [self setVolume:0.5];
}

+ (NSString *)getNameOfPersonAtIndex:(NSInteger)position {
    Person *person = [[Singleton sharedInstance].people objectAtIndex:position];
    NSString *result = person.name;
    return result;
}

+ (NSInteger)getEnumCount {
    return enumCount;
}
+ (BOOL)checkAge:(NSInteger)age {
    if (age < minAge) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)
                                                        message:[NSString stringWithFormat:NSLocalizedString(@"Sorry entrance to our club with only %ld years of age", nil), minAge]
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                              otherButtonTitles:nil];
        
        [alert show];
 
    }
    if (age < minAge) return NO; else return YES;
}

+ (BOOL)checkNameField:(NSString *)name {
    if ([name isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)
                                                        message:[NSString stringWithFormat:NSLocalizedString(@"Name field is empty", nil)]
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                              otherButtonTitles:nil];
        
        [alert show];
    } else return YES;
    return NO;
}

+ (NSString *)getStringValueOfSkillAtIndex:(NSInteger)position {
    switch (position) {
        case 0:
            return @"Rnb";
            break;
        case 1:
            return @"Pop";
            break;
        case 2:
            return @"Electrodance";
            break;
        default:
            return @"None";
            break;
    }
}

+ (NSString *)getSkillOfPerson:(Person *)person {
    if ([person isKindOfClass:([PersonWithRnbSkill class])]) return @"Rnb";
    if ([person isKindOfClass:([PersonWithPopSkill class])]) return @"Pop";
    if ([person isKindOfClass:([PersonWithElectrodanceSkill class])]) return @"Electrodance";
    return @"None";
}

- (NSString *)SkillToString:(Skills)skill {
    NSString *result;
    switch (skill) {
        case Rnb:
            result = @"Rnb";
            break;
        case Pop:
            result = @"Pop";
            break;
        case Electrodance:
            result = @"Electrodance";
            break;
        default:
            result = @"None";
    }
    return result;
}

+ (Skills)getSkillAtIndex:(NSInteger)position {
    switch (position) {
        case 0:
            return Rnb;
            break;
            
        case 1:
            return Pop;
            break;
        case 2:
            return Electrodance;
            break;
        default:
            return None;
            break;
    }
}

+ (void)setCurrentSkill:(Skills)skill {
    currentSkill = skill;
}

+ (NSString *)startStop {
    if (isNowPlay) {
        [audioPlayer stop];
        isNowPlay = NO;
        return NSLocalizedString(@"Play", nil);
    } else {
        [audioPlayer play];
        isNowPlay = YES;
        return NSLocalizedString(@"Pause", nil);
    }
}

+ (void)nextSong {
    actualNumberOfSong = (music.count - 1 > actualNumberOfSong) ? actualNumberOfSong+1 : 0;
    if (isNowPlay) {
        [audioPlayer stop];
        [self setAudioPlayerWithSong:[music objectAtIndex:actualNumberOfSong]];
        [audioPlayer play];
    } else {
        [self setAudioPlayerWithSong:[music objectAtIndex:actualNumberOfSong]];
    }
}

+ (void)previousSong {
    actualNumberOfSong = (actualNumberOfSong == 0) ? music.count-1 : actualNumberOfSong-1;
    if (isNowPlay) {
        [audioPlayer stop];
        [self setAudioPlayerWithSong:[music objectAtIndex:actualNumberOfSong]];
        [audioPlayer play];
    } else {
        [self setAudioPlayerWithSong:[music objectAtIndex:actualNumberOfSong]];
    }
}

+ (void)setAudioPlayerWithSong:(NSString *)song {
    NSString *path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], song];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    audioPlayer.volume = 0.5;
}

+ (void)setVolume:(float)value {
    audioPlayer.volume = value;
}

+ (void)addNewPersonWithName:(NSString *)name Age:(NSInteger)age {
    Person *person;
    switch (currentSkill) {
        case Rnb:
            person = [PersonWithRnbSkill new];
            break;
        case Pop:
            person = [PersonWithPopSkill new];
            break;
        case Electrodance:
            person = [PersonWithElectrodanceSkill new];
            break;
        default:
            person = [Person new];
            break;
    }
    [person initWithName:name Age:age];
    [[Singleton sharedInstance].people addObject:person];
}

+ (NSString *)getNameOfMusic {
    NSString *str = [music objectAtIndex:actualNumberOfSong];
    NSRange range = [str rangeOfString:@" "];
    NSString *result = [str substringFromIndex:range.location+3];
    result = [result substringToIndex:(result.length-4)];
    return result;
}

+ (NSString *)getGenreOfMusic {
    NSString *str = [music objectAtIndex:actualNumberOfSong];
    NSRange range = [str rangeOfString:@" "];
    NSString *result = [str substringToIndex:range.location];
    return result;
}

+ (NSString *)getReport {
    NSString *result = [NSString new];
    if ([Singleton sharedInstance].people.count == 0) return NSLocalizedString(@"The club now has no visitors.", nil);
    if (!isNowPlay) return NSLocalizedString(@"Music does not play.", nil);
    if (isNowPlay) {
        for (Person *person in [Singleton sharedInstance].people) {
            if ([[self getGenreOfMusic] isEqual:[self getSkillOfPerson:person]]) {
                result = [NSString stringWithFormat:NSLocalizedString(@"%@\n%@ dancing(%@).", nil), result, person.name, person.movements];
            } else {
                result = [NSString stringWithFormat:NSLocalizedString(@"%@\n%@ drinking Vodka in bar.", nil), result, person.name];
            }
        }
    }
    return result;
}

@end
