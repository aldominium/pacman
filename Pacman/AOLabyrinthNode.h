//
//  AOLabyrinthNode.h
//  Pacman
//
//  Created by Aldo Olivares Dominguez on 30/08/14.
//  Copyright (c) 2014 Aldominium. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface AOLabyrinthNode : SKSpriteNode

typedef NS_ENUM(NSUInteger, AOCorridorType) {
    UD = 2,
    RL = 3,
    UR = 4,
    RD = 5,
    DL = 6,
    LU = 7,
    URD = 8,
    RDL = 9,
    DLU = 10,
    LUR = 11,
    URDL = 12,
    WALL = 1
    
};

@property (nonatomic) NSArray* lab;
@property (nonatomic) NSInteger numero;


+(instancetype)createLabyrinthinScene:(SKScene*)scene;
-(NSInteger)labyrinthAtRow:(NSInteger)row column:(NSInteger)column;

@end
