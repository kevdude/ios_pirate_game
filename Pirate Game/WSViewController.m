//
//  WSViewController.m
//  Pirate Game
//
//  Created by KeVDuDe on 11/04/2014.
//  Copyright (c) 2014 KeVDuDe. All rights reserved.
//

#import "WSViewController.h"
#import "WSTileFactory.h"
#import "WSWeapon.h"
#import "WSAid.h"
#import "WSBadGuy.h"

@interface WSViewController ()

@end

@implementation WSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self newGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// public

- (void) newGame {
    self.actionOutlet.enabled = NO;
    self.currentPosition = CGPointMake(0, 0);
    self.tiles = [WSTileFactory generateTiles];
    self.hero = self.tiles[0][0];
    [self updateScreen];
}

- (IBAction)actionButtonAction:(UIButton *)sender {
    sender.enabled = NO;
    
    WSTile *currentTile = [self currentTile];
    
    NSLog(@"Performing action on %@", currentTile.name);
    
    if ([currentTile isKindOfClass:[WSWeapon class]]){
        [self weaponAction:((WSWeapon *)currentTile)];
        
    } else if ([currentTile isKindOfClass:[WSArmor class]]){
        [self armorAction:(WSArmor *) currentTile];
        
    } else if ([@"Boss" isEqualToString:(currentTile.name)]){
        [self bossAction:(WSCharacter *) currentTile];
        
    } else if ([currentTile isKindOfClass:[WSAid class]]) {
        [self aidAction:(WSAid *) currentTile];
    }
    else {
        [self badGuyAction:(WSBadGuy *) currentTile];
    }
    [self hideNavigationButtons:NO];
    [self updateScreen];
}

- (IBAction)northButtonAction:(UIButton *)sender {
    self.actionOutlet.enabled = YES;
    self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y + 1);
    [self updateScreen];
    [self disableNavigationButtonsIfBadGuyOrBoss];
}

- (IBAction)eastButtonAction:(UIButton *)sender {
    self.actionOutlet.enabled = YES;
    self.currentPosition = CGPointMake(self.currentPosition.x + 1, self.currentPosition.y);
    [self updateScreen];
    [self disableNavigationButtonsIfBadGuyOrBoss];
}

- (IBAction)southButtonAction:(UIButton *)sender {
    self.actionOutlet.enabled = YES;
    self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y - 1);
    [self updateScreen];
    [self disableNavigationButtonsIfBadGuyOrBoss];
}

- (IBAction)westButtonAction:(UIButton *)sender {
    self.actionOutlet.enabled = YES;
    self.currentPosition = CGPointMake(self.currentPosition.x - 1, self.currentPosition.y);
    [self updateScreen];
    [self disableNavigationButtonsIfBadGuyOrBoss];
}

- (IBAction)resetButtonAction:(UIButton *)sender {
    [self newGame];
}

// private

- (void) updateScreen {
    WSTile *currentTile = [self currentTile];
    [self updateNavigationControls];
    [self updateCharacterStats];
    [self updateActionView:currentTile];
    [self updateStory:currentTile];
    self.backgroundOutlet.image = currentTile.backgroundImage;
}

- (void) updateCharacterStats {
    self.healthOutlet.text = [NSString stringWithFormat:@"%i", self.hero.health];
    self.damageOutlet.text = [NSString stringWithFormat:@"%i", self.hero.damage];
    self.weaponOutlet.text = [NSString stringWithFormat: @"%@:%i", self.hero.weapon.name, self.hero.weapon.damage];
    if (self.hero.armor != nil) {
        self.armorOutlet.text = [NSString stringWithFormat: @"%@:%i", self.hero.armor.name, self.hero.armor.health];
    } else {
        self.armorOutlet.text = @"None";
    }
}

- (void) updateActionView:(WSTile *) tile {
    [self.actionOutlet setTitle:tile.buttonNameTxt forState:UIControlStateNormal];
}

- (void) updateStory:(WSTile *) tile {
    self.storyOutlet.text = [NSString stringWithFormat:@"%@", tile.storyTxt];
}

- (void) updateNavigationControls {
    int x = self.currentPosition.x;
    int y = self.currentPosition.y;
    
    if (x == 0) {
        self.westButtonOutlet.hidden = YES;
    } else {
        self.westButtonOutlet.hidden = NO;
    }
    
    if (x >= [self.tiles count]-1) {
        self.eastButtonOutlet.hidden = YES;
    } else {
        self.eastButtonOutlet.hidden = NO;
    }
    
    if (y == 0) {
        self.southButtonOutlet.hidden = YES;
    } else {
        self.southButtonOutlet.hidden = NO;
    }
    
    if (y >= [self.tiles[0] count]-1) {
        self.northButtonOutlet.hidden = YES;
    } else {
        self.northButtonOutlet.hidden = NO;
    }
}

- (void) hideNavigationButtons:(BOOL) show {
    self.northButtonOutlet.hidden = show;
    self.southButtonOutlet.hidden = show;
    self.eastButtonOutlet.hidden = show;
    self.westButtonOutlet.hidden = show;
}

- (void) disableNavigationButtonsIfBadGuyOrBoss {
    WSTile *currentTile = [self currentTile];
    
    if ([currentTile isKindOfClass:[WSBadGuy class]] || [@"Boss" isEqualToString:(currentTile.name)]) {
        [self hideNavigationButtons:YES];
    }
}

- (WSTile *) currentTile {
    return self.tiles[(int)self.currentPosition.x][(int)self.currentPosition.y];
}

- (void) weaponAction:(WSWeapon *) weapon{
    self.hero.weapon = weapon;
    
    NSString *userMsg = [NSString stringWithFormat:@"You now have a %@.", weapon.name];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Weapon Added" message:userMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void) armorAction:(WSArmor *) armor {
    self.hero.armor = armor;
    
    NSString *userMsg = [NSString stringWithFormat:@"You now have armor."];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Armor Added" message:userMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void) bossAction:(WSCharacter *) boss {
    
    if ([self.hero fightBossToDeath:(boss)]){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You Lost!" message:@"The Boss Pirate beat you!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
        [self newGame];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You Won!" message:@"Well done you beat the Boss Pirate!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
        [self newGame];
    }
}

- (void) aidAction:(WSAid *) aid {
    [self.hero takeAid:(aid.health)];
    NSString *userMsg = [NSString stringWithFormat:@"The %@ increased your health by %i points", aid.name,
                         aid.health];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Health Increased!" message:userMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void) badGuyAction:(WSBadGuy *) badGuy {
    if ([self.hero takeDamage:(badGuy.damage)]){
        NSString *userMsg = [NSString stringWithFormat:@"%@ beat you!", badGuy.name];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"You Lost!" message:userMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
        [self newGame];
    } else {
        NSString *userMsg = [NSString stringWithFormat:@"%@ decreased your health by %i points", badGuy.name,
                             badGuy.damage];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Health decreased!" message:userMsg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
    }
}

@end
