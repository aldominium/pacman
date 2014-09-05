//
//  AOControlNode.m
//  Pacman
//
//  Created by Aldo Olivares Dominguez on 30/08/14.
//  Copyright (c) 2014 Aldominium. All rights reserved.
//

#import "AOControlNode.h"

@implementation AOControlNode

+(instancetype)createControlAtPosition:(CGPoint)position{
    AOControlNode *control = [self spriteNodeWithImageNamed:@"control"];
    control.name = @"control";
    control.position = position;
    NSLog(@"HEIGHT %f",control.frame.size.height);
    NSLog(@"WIDTH %f",control.frame.size.width);
    
    return control;
}



@end
