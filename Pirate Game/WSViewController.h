//
//  WSViewController.h
//  Pirate Game
//
//  Created by KeVDuDe on 11/04/2014.
//  Copyright (c) 2014 KeVDuDe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WSCharacter.h"

@interface WSViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *backgroundOutlet;

@property (strong, nonatomic) IBOutlet UILabel *healthOutlet;
@property (strong, nonatomic) IBOutlet UILabel *damageOutlet;
@property (strong, nonatomic) IBOutlet UILabel *weaponOutlet;
@property (strong, nonatomic) IBOutlet UILabel *armorOutlet;

@property (strong, nonatomic) IBOutlet UIButton *actionOutlet;

@property (strong, nonatomic) IBOutlet UILabel *storyOutlet;

@property (strong, nonatomic) IBOutlet UIButton *northButtonOutlet;
@property (strong, nonatomic) IBOutlet UIButton *eastButtonOutlet;
@property (strong, nonatomic) IBOutlet UIButton *southButtonOutlet;
@property (strong, nonatomic) IBOutlet UIButton *westButtonOutlet;

@property (nonatomic) CGPoint currentPosition;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) WSCharacter *hero;

- (void) newGame;
- (IBAction)actionButtonAction:(UIButton *)sender;
- (IBAction)northButtonAction:(UIButton *)sender;
- (IBAction)eastButtonAction:(UIButton *)sender;
- (IBAction)southButtonAction:(UIButton *)sender;
- (IBAction)westButtonAction:(UIButton *)sender;
- (IBAction)resetButtonAction:(UIButton *)sender;

@end
