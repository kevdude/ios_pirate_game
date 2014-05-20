//
//  WSCharacter.m
//  Pirate Game
//
//  Created by KeVDuDe on 11/04/2014.hel
//  Copyright (c) 2014 KeVDuDe. All rights reserved.
//

#import "WSCharacter.h"

@implementation WSCharacter

#pragma mark - public methods

- (void) takeAid:(int) aid {
    self.health = self.health + aid;
}

- (Boolean) takeDamage:(int) damage {
    if ([self hasArmor]) {
        self.armor.health = self.armor.health - damage;
        
        if (self.armor.health < 0) {
            self.health = self.health + self.armor.health;
            self.armor.health = 0;
        }
    } else {
        self.damage = self.damage + damage;
        self.health = self.health - damage;
        
        if (self.health < 0) {
            self.health = 0;
        }
        
        if (self.damage > 100) {
            self.damage = 100;
        }
    }
    return [self dead];
}

- (Boolean) fightBossToDeath:(WSCharacter *) boss {
    do {
        [self takeDamage:(boss.weapon.damage)];
        NSLog(@"My health is %d", self.health);
        NSLog(@"My armor is %d", self.armor.health);
        if (![self dead]) {
            [boss takeDamage:(self.weapon.damage)];
            NSLog(@"Bosses health is %d", boss.health);
            NSLog(@"Bosses armor is %d", boss.armor.health);
        }
    } while ((![self dead]) && (![boss dead]));
    
    return [self dead];
}

- (Boolean) dead {
    if (self.health <= 0) {
        self.health = 0;
        return YES;
    } else {
        return NO;
    }
}

- (Boolean) hasArmor {
    return self.armor != nil && self.armor.health > 0;
}

- (Boolean) hasWeapon {
    return self.weapon != nil;
}

@end
