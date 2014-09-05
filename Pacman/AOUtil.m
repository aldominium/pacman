//
//  AOUtil.m
//  Pacman
//
//  Created by Aldo Olivares Dominguez on 31/08/14.
//  Copyright (c) 2014 Aldominium. All rights reserved.
//

#import "AOUtil.h"

@implementation AOUtil

+ (NSInteger) randomWithMin:(NSInteger)min max:(NSInteger)max{
    
    return arc4random()%(max-min) + min;
}

@end
