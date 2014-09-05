//
//  AOGhostNode.m
//  Pacman
//
//  Created by Aldo Olivares Dominguez on 03/09/14.
//  Copyright (c) 2014 Aldominium. All rights reserved.
//

#import "AOGhostNode.h"

@implementation AOGhostNode

+(instancetype)createGhostAtPosition:(CGPoint)position ofType:(AOGhostType)type{
    
    AOGhostNode *ghost;
    
    
    
    
    switch (type){
        case AOGhostTypeBlynky:
            ghost = [self spriteNodeWithImageNamed:@"blinky"];
            //ghost.rightTextures = @[[SKTexture textureWithImageNamed:@"pacman-1"], [SKTexture textureWithImageNamed:@"pacman-2"],[SKTexture textureWithImageNamed:@"pacman-3"]];
            ghost.name = @"blinky";
            
            break;
        case AOGhostTypeDarky:
            ghost = [self spriteNodeWithImageNamed:@"darky"];
            ghost.name = @"darky";
            
            break;
        case AOGhostTypeMonkey:
            ghost = [self spriteNodeWithImageNamed:@"monkey"];
            ghost.name = @"monkey";
            
            break;
        case AOGhostTypePinky:
            ghost = [self spriteNodeWithImageNamed:@"pinky"];
            ghost.name = @"pinky";
            break;
        default:
            break;
            
    }
    
    
    
    //SKAction *animation = [SKAction animateWithTextures:ghost.rightTextures timePerFrame:0.1];
    //[ghost runAction:[SKAction repeatActionForever:animation]];
    ghost.anchorPoint = CGPointMake(0, 0);
    ghost.position = position;
    //ghost.name = @"pacman";
    ghost.row = 23;
    ghost.col = 2;
    ghost.canMove = YES;
    
    return  ghost;
    
}




@end
