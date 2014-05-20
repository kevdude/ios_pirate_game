//
//  WSTileFactory.m
//  Pirate Game
//
//  Created by KeVDuDe on 11/04/2014.
//  Copyright (c) 2014 KeVDuDe. All rights reserved.
//

#import "WSTileFactory.h"
#import "WSTile.h"
#import "WSWeapon.h"
#import "WSArmor.h"
#import "WSCharacter.h"
#import "WSBadGuy.h"
#import "WSAid.h"

@implementation WSTileFactory

#pragma mark - public methods

+ (NSArray *) generateTiles {

    NSMutableArray *availableTiles = [WSTileFactory createTiles];
    
    WSCharacter *hero = [availableTiles objectAtIndex:0];
    [availableTiles removeObjectAtIndex:0];
    
    NSArray *column1 = [[NSArray alloc] initWithObjects:hero,
                        [WSTileFactory removeAndReturnRandomTile:availableTiles],
                        [WSTileFactory removeAndReturnRandomTile:availableTiles],
                                                                            nil];

    NSArray *column2 = [[NSArray alloc] initWithObjects:[WSTileFactory removeAndReturnRandomTile:availableTiles],
                        [WSTileFactory removeAndReturnRandomTile:availableTiles],
                        [WSTileFactory removeAndReturnRandomTile:availableTiles],
                        nil];
    
    NSArray *column3  = [[NSArray alloc] initWithObjects:[WSTileFactory removeAndReturnRandomTile:availableTiles],
                        [WSTileFactory removeAndReturnRandomTile:availableTiles],
                        [WSTileFactory removeAndReturnRandomTile:availableTiles],
                        nil];
    
    NSArray *column4  = [[NSArray alloc] initWithObjects:[WSTileFactory removeAndReturnRandomTile:availableTiles],
                         [WSTileFactory removeAndReturnRandomTile:availableTiles],
                         [WSTileFactory removeAndReturnRandomTile:availableTiles],
                         nil];
    
    return[[NSArray alloc] initWithObjects:column1, column2, column3, column4, nil];
}

#pragma mark - private methods

+ (NSMutableArray *) createTiles {
    WSBadGuy *pirateAttack = [[WSBadGuy alloc] init];
    pirateAttack.name = @"Pirate Attack";
    pirateAttack.damage = 10;
    pirateAttack.health = 0;
    pirateAttack.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    pirateAttack.storyTxt = @"Oh no the pirates are attacking!";
    pirateAttack.buttonNameTxt = @"Fight Pirates";
    
    WSWeapon *sword = [[WSWeapon alloc] init];
    sword.name = @"Sword";
    sword.damage = 10;
    sword.health = 0;
    sword.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    sword.storyTxt = @"The blacksmith makes you a powerful sword!";
    sword.buttonNameTxt = @"Take Sword";
    
    WSAid *safeDock = [[WSAid alloc] init];
    safeDock.name = @"Safe Dock";
    safeDock.damage = 0;
    safeDock.health = 20;
    safeDock.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    safeDock.storyTxt = @"Take a well earned rest in the safe dock";
    safeDock.buttonNameTxt = @"Dock Ship";
    
    WSBadGuy *octopusAttack = [[WSBadGuy alloc] init];
    octopusAttack.name = @"Octopus Attack";
    octopusAttack.damage = 20;
    octopusAttack.health = 0;
    octopusAttack.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    octopusAttack.storyTxt = @"A giant octopus is about to attack!";
    octopusAttack.buttonNameTxt = @"Fight Octopus";
    
    WSAid *parrot = [[WSAid alloc] init];
    parrot.name = @"Parrot";
    parrot.damage = 0;
    parrot.health = 10;
    parrot.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    parrot.storyTxt = @"A parrot a day can help you relax!";
    parrot.buttonNameTxt = @"Take Parrot";
    
    WSBadGuy *walkThePlank = [[WSBadGuy alloc] init];
    walkThePlank.name = @"Walk the Plank";
    walkThePlank.damage = 5;
    walkThePlank.health = 0;
    walkThePlank.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    walkThePlank.storyTxt = @"Time to walk the plank!";
    walkThePlank.buttonNameTxt = @"Walk Plank";
    
    WSBadGuy *shipAttack = [[WSBadGuy alloc] init];
    shipAttack.name = @"Ship Attack";
    shipAttack.damage = 15;
    shipAttack.health = 0;
    shipAttack.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    shipAttack.storyTxt = @"A Pirate ship is attacking!";
    shipAttack.buttonNameTxt = @"Fight Pirate Ship";
    
    WSArmor *goldArmor1 = [[WSArmor alloc] init];
    goldArmor1.name = @"Gold Armor";
    goldArmor1.damage = 0;
    goldArmor1.health = 100;
    goldArmor1.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    goldArmor1.storyTxt = @"You found some pirate treasure, enough to make some armour!";
    goldArmor1.buttonNameTxt = @"Make Armour";
    
    WSArmor *goldArmor2 = [[WSArmor alloc] init];
    goldArmor2.name = @"Gold Armor";
    goldArmor2.damage = 0;
    goldArmor2.health = 100;
    goldArmor2.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    goldArmor2.storyTxt = @"You found some pirate treasure, enough to make some armour!";
    goldArmor2.buttonNameTxt = @"Make Armour";
    
    WSWeapon *gun = [[WSWeapon alloc] init];
    gun.name = @"Pistol";
    gun.damage = 20;
    gun.health = 0;
    gun.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    gun.storyTxt = @"You have found a pistol!";
    gun.buttonNameTxt = @"Take Pistol";
    
    WSWeapon *hands = [[WSWeapon alloc] init];
    hands.name = @"Bare Hands";
    hands.damage = 5;
    hands.health = 0;
    
    WSCharacter *hero = [[WSCharacter alloc] init];
    hero.name = @"Hero";
    hero.damage = 0;
    hero.health = 100;
    hero.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    hero.storyTxt = @"And so the journey begins...";
    hero.buttonNameTxt = @"...";
    hero.weapon = hands;
    
    WSCharacter *boss = [[WSCharacter alloc] init];
    boss.name = @"Boss";
    boss.damage = 0;
    boss.health = 100;
    boss.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    boss.storyTxt = @"Oh no its the deadliest Pirate of them all!";
    boss.buttonNameTxt = @"Fight Pirate";
    boss.armor = goldArmor2;
    boss.weapon = sword;
    
    return [[NSMutableArray alloc] initWithObjects:hero, pirateAttack, sword, safeDock, octopusAttack, parrot, walkThePlank, shipAttack, goldArmor1, goldArmor2, gun, boss, nil];
}

+ (int) randomArrayPosition:(NSArray *) array {
    return arc4random() % array.count;
}

+ (WSTile *) removeAndReturnRandomTile:(NSMutableArray *) array {
    int randomIndex = [WSTileFactory randomArrayPosition:array];
    WSTile *tile = [array objectAtIndex:randomIndex];
    [array removeObjectAtIndex:randomIndex];
    return tile;
}

@end
