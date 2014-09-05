//
//  AOGhostNode.h
//  Pacman
//
//  Created by Aldo Olivares Dominguez on 03/09/14.
//  Copyright (c) 2014 Aldominium. All rights reserved.
//

#import "AOMovable.h"



@interface AOGhostNode : AOMovable

typedef NS_ENUM(NSUInteger, AOGhostType) {
    AOGhostTypeBlynky,
    AOGhostTypePinky,
    AOGhostTypeMonkey,
    AOGhostTypeDarky
    
};

+(instancetype)createGhostAtPosition:(CGPoint)position ofType:(AOGhostType)type;


@end
