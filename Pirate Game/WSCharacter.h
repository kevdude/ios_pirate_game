//
//  WSCharacter.h
//  Pirate Game
//
//  Created by KeVDuDe on 11/04/2014.
//  Copyright (c) 2014 KeVDuDe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSWeapon.h"
#import "WSArmor.h"

@interface WSCharacter : WSTile

@property (strong, nonatomic) WSWeapon *weapon;
@property (strong, nonatomic) WSArmor *armor;

- (void) takeAid:(int) aid;
- (Boolean) takeDamage:(int) damage;
- (Boolean) fightBossToDeath:(WSCharacter *) boss;
- (Boolean) dead;
- (Boolean) hasArmor;
- (Boolean) hasWeapon;

@end
