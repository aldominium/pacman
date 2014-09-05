//
//  AOPacmanNode.m
//  Pacman
//
//  Created by Aldo Olivares Dominguez on 30/08/14.
//  Copyright (c) 2014 Aldominium. All rights reserved.
//

#import "AOPacmanNode.h"
#import "AOUtil.h"

@interface AOPacmanNode ()


@end


@implementation AOPacmanNode



+(instancetype)createPacmanAtPosition:(CGPoint)position{
    
    AOPacmanNode *pacman = [self spriteNodeWithImageNamed:@"pacman-3"];
    pacman.rightTextures = @[[SKTexture textureWithImageNamed:@"pacman-1"], [SKTexture textureWithImageNamed:@"pacman-2"],[SKTexture textureWithImageNamed:@"pacman-3"]];
    
    SKAction *animation = [SKAction animateWithTextures:pacman.rightTextures timePerFrame:0.1];
    [pacman runAction:[SKAction repeatActionForever:animation]];
    pacman.anchorPoint = CGPointMake(0, 0);
    pacman.position = position;
    pacman.name = @"pacman";
    pacman.row = 23;
    pacman.col = 1;
    pacman.canMove = YES;
    pacman.direction = idle;

    return  pacman;
    
}

@end
