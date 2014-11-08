//
//  MusicViewController.m
//  NightClub
//
//  Created by itisioslab on 07.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "MusicViewController.h"


@implementation MusicViewController {
    int actualNumberOfSong;
    BOOL isNowPlay;
}

@synthesize music, nameOfMusic, genre;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    music = [[NSArray alloc] initWithObjects:@"Blues - Velhas Virgens - Essa tal de tequila.mp3",
                                            @"Electro - Death Grips - Lord of the Game.mp3",
                                            @"Electro - The Echelon Effect - Your First Light My Eventide.mp3",
                                            @"Hip-Hop - Death Grips - Spread Eagle Cross the Block.mp3",
                                            @"Jazz - Gaba Kulka - Emily.mp3",
                                            @"Pop - Blackbird Blackbird - Left To Hurt.mp3",
                                            @"Pop - Flora Matos - Pretin.mp3",
                                            @"Rnb - Com Truise - Slow Peels.mp3", nil];
    isNowPlay = NO;
    actualNumberOfSong = 0;
    nameOfMusic.text = [self getName:[music objectAtIndex:actualNumberOfSong]];
    genre.text = [self getGenre:[music objectAtIndex:actualNumberOfSong]];
    [super viewDidLoad];
    [self setAudioPlayerWithSong:[music objectAtIndex:actualNumberOfSong]];
    
    // Do any additional setup after loading the view.
    
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

- (void)setAudioPlayerWithSong:(NSString *)str {
    NSString *path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], str];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    audioPlayer.volume = 0.5;
}

- (IBAction)nextSong {
    actualNumberOfSong = (music.count - 1 > actualNumberOfSong) ? actualNumberOfSong+1 : 0;
    nameOfMusic.text = [self getName:[music objectAtIndex:actualNumberOfSong]];
    genre.text = [self getGenre:[music objectAtIndex:actualNumberOfSong]];
    NSLog(@"%d", actualNumberOfSong);
    if (isNowPlay) {
        [audioPlayer stop];
        [self setAudioPlayerWithSong:[music objectAtIndex:actualNumberOfSong]];
        [audioPlayer play];
    } else {
        [self setAudioPlayerWithSong:[music objectAtIndex:actualNumberOfSong]];
    }
    
}

- (IBAction)sliderChanged:(id)sender{
    UISlider *slider = (UISlider *)sender;
    audioPlayer.volume = slider.value;
}

- (IBAction)previousSong {
    actualNumberOfSong = (actualNumberOfSong == 0) ? music.count-1 : actualNumberOfSong-1;
    nameOfMusic.text = [self getName:[music objectAtIndex:actualNumberOfSong]];
    genre.text = [self getGenre:[music objectAtIndex:actualNumberOfSong]];
    if (isNowPlay) {
        [audioPlayer stop];
        [self setAudioPlayerWithSong:[music objectAtIndex:actualNumberOfSong]];
        [audioPlayer play];
    } else {
        [self setAudioPlayerWithSong:[music objectAtIndex:actualNumberOfSong]];
    }
}

- (NSString *)getGenre:(NSString *)str {
    NSRange range = [str rangeOfString:@" "];
    NSString *result = [str substringToIndex:range.location];
    result = [NSString stringWithFormat:@"Жанр: %@", result];
    //NSString *result = [str substringWithRange:range];
    return result;
}

- (NSString *)getName:(NSString *)str {
    NSRange range = [str rangeOfString:@" "];
    NSString *result = [str substringFromIndex:range.location+3];
    result = [result substringToIndex:(result.length-4)];
    return result;
}

- (IBAction)startStop:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (isNowPlay) {
       // [sender setTitle:@"Stop"];
        [audioPlayer stop];
        isNowPlay = NO;
        [button setTitle:@"Play" forState:UIControlStateNormal];
    } else {
        //[sender setTitle:@"Stop"];
        [audioPlayer play];
        isNowPlay = YES;
        [button setTitle:@"Pause" forState:UIControlStateNormal];
    }
}
/*
- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{
    // 1
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // 2
    NSError *error;
    
    // 3
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    // 4
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    
    // 5
    return audioPlayer;
}*/

@end
