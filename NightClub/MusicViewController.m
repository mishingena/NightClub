//
//  MusicViewController.m
//  NightClub
//
//  Created by itisioslab on 07.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "MusicViewController.h"


@implementation MusicViewController

@synthesize nameOfMusic, genre, playButton, nextButton, previousButton, checkActivity, genreL;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"musicPict.png"]];
    
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
    [super viewDidLoad];
    nameOfMusic.text = [Model getNameOfMusic];
    genre.text = [Model getGenreOfMusic];
    [playButton setTitle:NSLocalizedString(@"Play", nil) forState:UIControlStateNormal];
    [nextButton setTitle:NSLocalizedString(@"Next", nil) forState:UIControlStateNormal];
    [previousButton setTitle:NSLocalizedString(@"Previous", nil) forState:UIControlStateNormal];
    [checkActivity setTitle:NSLocalizedString(@"View activity", nil) forState:UIControlStateNormal];
    genreL.text = NSLocalizedString(@"Genre: ", nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)nextSong {
    [Model nextSong];
    nameOfMusic.text = [Model getNameOfMusic];
    genre.text = [Model getGenreOfMusic];
}

- (IBAction)sliderChanged:(id)sender{
    UISlider *slider = (UISlider *)sender;
    [Model setVolume:slider.value];
}

- (IBAction)previousSong {
    [Model previousSong];
    nameOfMusic.text = [Model getNameOfMusic];
    genre.text = [Model getGenreOfMusic];
}

- (IBAction)startStop:(id)sender {
    [playButton setTitle:[Model startStop] forState:UIControlStateNormal];
}

@end
