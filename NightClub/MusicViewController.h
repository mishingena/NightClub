//
//  MusicViewController.h
//  NightClub
//
//  Created by itisioslab on 07.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MusicViewController : UIViewController {
    AVAudioPlayer *audioPlayer;
}

@property (strong, nonatomic) NSArray *music;

- (IBAction)nextSong;
- (IBAction)previousSong;
- (IBAction)startStop;

@property (strong, nonatomic) IBOutlet UILabel *nameOfMusic;
@property (strong, nonatomic) IBOutlet UILabel *genre;

- (NSString *)getGenre:(NSString *)str;
- (NSString *)getName:(NSString *)str;


@end
