//
//  MusicViewController.h
//  NightClub
//
//  Created by itisioslab on 07.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"


@interface MusicViewController : UIViewController

- (IBAction)nextSong;
- (IBAction)previousSong;
- (IBAction)startStop:(id)sender;
- (IBAction)sliderChanged:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *nameOfMusic;
@property (strong, nonatomic) IBOutlet UILabel *genre;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (weak, nonatomic) IBOutlet UIButton *checkActivity;
@property (weak, nonatomic) IBOutlet UILabel *genreL;
@end
