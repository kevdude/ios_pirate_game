//
//  WSTile.h
//  Pirate Game
//
//  Created by KeVDuDe on 11/04/2014.
//  Copyright (c) 2014 KeVDuDe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSTile : NSObject

@property (strong, nonatomic) NSString *storyTxt;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *buttonNameTxt;
@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (strong, nonatomic) NSString *name;

@end
