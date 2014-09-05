//
//  AOUtil.h
//  Pacman
//
//  Created by Aldo Olivares Dominguez on 31/08/14.
//  Copyright (c) 2014 Aldominium. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AOLabyrinthNode.h"

//variables Globales
static const float AOPacmanSpeed = .3;
static const float AOPacmanSpeedSlow = .6;


@interface AOUtil : NSObject

+ (NSInteger) randomWithMin:(NSInteger)min max:(NSInteger)max;

@end


/*
 
 
 
*/