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
    music = [[NSArray alloc] initWithObjects:@"Blues - Velhas Virgens - Essa tal de tequila",
                                            @"Electro - Death Grips - Lord of the Game",
                                            @"Electro - The Echelon Effect - Your First Light My Eventide",
                                            @"Hip-Hop - Death Grips - Spread Eagle Cross the Block",
                                            @"Jazz - Gaba Kulka - Emily",
                                            @"Pop - Blackbird Blackbird - Left To Hurt",
                                            @"Pop - Flora Matos - Pretin",
                                            @"Rnb - Com Truise - Slow Peels", nil];
    
    actualNumberOfSong = 0;
    nameOfMusic.text = [self getName:[music objectAtIndex:actualNumberOfSong]];
    genre.text = [self getGenre:[music objectAtIndex:actualNumberOfSong]];
    [super viewDidLoad];
    
    NSString *path = [NSString stringWithFormat:@"/Users/itisioslab/Documents/Gena/NightClub/NightClub/MySong.mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
   // NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[music objectAtIndex:actualNumberOfSong] ofType:@"mp3"]];
    //NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@" ,[music objectAtIndex:actualNumberOfSong]] ];//, [[NSBundle mainBundle] resourcePath]]];
    //NSLog(@"%@", url);
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    NSLog(@"%@", url);
    audioPlayer.numberOfLoops = -1;
/*
    if (audioPlayer == nil)
		NSLog(@"%@",[error description]);
	else
		[audioPlayer play];

    //audioPlayer.volume = 1;

	//*/
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

- (IBAction)nextSong {
    actualNumberOfSong = (music.count - 1 > actualNumberOfSong) ? actualNumberOfSong+1 : 0;
    nameOfMusic.text = [self getName:[music objectAtIndex:actualNumberOfSong]];
    genre.text = [self getGenre:[music objectAtIndex:actualNumberOfSong]];
}

- (IBAction)previousSong {
    actualNumberOfSong = (actualNumberOfSong == 0) ? music.count-1 : actualNumberOfSong-1;
    nameOfMusic.text = [self getName:[music objectAtIndex:actualNumberOfSong]];
    genre.text = [self getGenre:[music objectAtIndex:actualNumberOfSong]];
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
    result = [result substringToIndex:(result.length)];
    return result;
}

- (IBAction)startStop {
    audioPlayer.volume = 0.5;
    [audioPlayer play];
}

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
}

@end
