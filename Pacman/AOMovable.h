//
//  AOMovable.h
//  Pacman
//
//  Created by Aldo Olivares Dominguez on 03/09/14.
//  Copyright (c) 2014 Aldominium. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface AOMovable : SKSpriteNode

typedef NS_ENUM(NSUInteger, Direction) {
    idle = 0,
    Up = 1,
    Down = 2,
    Right = 3,
    Left = 4
    
};



@property (nonatomic) NSInteger row;
@property (nonatomic) NSInteger col;
@property BOOL canMove;
@property (nonatomic) NSArray *rightTextures;
@property (nonatomic) Direction direction;


-(void)moveUp;
-(void)moveDown;
-(void)moveRight;
-(void)moveLeft;
-(void)moveRightSlow;
-(void)moveLeftSlow;
-(void)moveUpNoRes;
-(void)moveRightNoRes;
-(void)moveLeftNoRes;
-(void)moveDownNoRes;


@end
