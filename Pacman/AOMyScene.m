//
//  AOMyScene.m
//  Pacman
//
//  Created by Aldo Olivares Dominguez on 27/08/14.
//  Copyright (c) 2014 Aldominium. All rights reserved.
//

#import "AOMyScene.h"
#import "AOControlNode.h"
#import "AOPacmanNode.h"
#import <AVFoundation/AVFoundation.h>
#import "AOUtil.h"
#import "AOLabyrinthNode.h"
#import "AOGhostNode.h"

@interface AOMyScene ()

@property (nonatomic)NSInteger moving;
@property (nonatomic) AVAudioPlayer *moveMusic;
@property (nonatomic) AOLabyrinthNode *laberinto;

@end


@implementation AOMyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        self.moving = 0;
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        
        
       
        
        self.laberinto = [AOLabyrinthNode createLabyrinthinScene:self];
        
        [self addChild:self.laberinto];
        
        
        
        AOPacmanNode *pacman = [AOPacmanNode createPacmanAtPosition:CGPointMake(13, 13)];
        [self addChild:pacman];
        
        
        AOControlNode *controlNode = [AOControlNode createControlAtPosition:CGPointMake(450, 150)];
        [self addChild:controlNode];
        
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"PacmanSiren8" withExtension:@"mp3"];
        
        self.moveMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        self.moveMusic.numberOfLoops = -1;
        [self.moveMusic prepareToPlay];
        
        SKLabelNode *title = [SKLabelNode labelNodeWithFontNamed:@"Joystix"];
        title.text = @"CLONNY-MAN";
        title.position = CGPointMake(450, 300);
        title.fontSize = 28;
        title.fontColor = [SKColor yellowColor];
        [self addChild:title];
        
        AOGhostNode *blinky = [AOGhostNode createGhostAtPosition:CGPointMake(26, 13) ofType:AOGhostTypeBlynky];
        [self addChild:blinky];
        blinky.direction = Right;
        blinky.canMove = YES;
        
        AOGhostNode *pinky = [AOGhostNode createGhostAtPosition:CGPointMake(39, 13) ofType:AOGhostTypePinky];
        [self addChild:pinky];
        
        AOGhostNode *darky = [AOGhostNode createGhostAtPosition:CGPointMake(52, 13) ofType:AOGhostTypeDarky];
        [self addChild:darky];
        
        AOGhostNode *monkey = [AOGhostNode createGhostAtPosition:CGPointMake(65, 13) ofType:AOGhostTypeMonkey];
        [self addChild:monkey];
        
        
        
        SKAction *moveBlinkyForever =[SKAction repeatActionForever:[SKAction runBlock:^{
            
            [self moveBlinky];
        }]];
        
        //[self runAction:moveBlinkyForever];
        
        
    }
    return self;
}

-(void) didMoveToView:(SKView *)view{
    //[self.moveMusic play];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    SKNode *touchedNode = [self nodeAtPoint:touchLocation];
    AOPacmanNode *pacman = (AOPacmanNode*)[self childNodeWithName:@"pacman"];
    
    if ([touchedNode.name isEqualToString:@"control"]) {
        
        
        if (touchLocation.x > 430 && touchLocation.y > 170) {
            
            if ([self.laberinto labyrinthAtRow:pacman.row - 1 column:pacman.col] != WALL) {
                
                self.moving = 1;
                pacman.direction = Up;
                
                
                
                
                
            }
            
        }else if (touchLocation.x > 430 && touchLocation.y < 130){
            if ([self.laberinto labyrinthAtRow:pacman.row + 1 column:pacman.col] != WALL) {
                self.moving = 3;
                pacman.direction = Down;
            }
            
        }else if (touchLocation.x > 470 && touchLocation.y > 130){
            if ([self.laberinto labyrinthAtRow:pacman.row column:pacman.col+1] != WALL) {
                self.moving = 2;
                pacman.direction = Right;
            }
            
            
        }else if (touchLocation.x < 430 && touchLocation.y < 170){
            
            if ([self.laberinto labyrinthAtRow:pacman.row column:pacman.col-1] != WALL) {
                
                self.moving = 4;
                pacman.direction = Left;
            }
            
        }

        
        
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    
    [self movePacman];
    SKAction *moveBli = [SKAction runBlock:^{
      [self moveBlinky];
    }];
    
    [self runAction:moveBli withKey:@"moveBli"];
    
    AOGhostNode *blinky = (AOGhostNode*)[self childNodeWithName:@"blinky"];
    NSLog(@"BLINK DIRECTION %d", blinky.direction);
    
    
    
}



-(void)movePacman{

    AOPacmanNode *pacman = (AOPacmanNode*)[self childNodeWithName:@"pacman"];
    
    switch (pacman.direction) {
        case Up:
            if ([self.laberinto labyrinthAtRow:pacman.row - 1 column:pacman.col] != WALL) {
                [pacman moveUp];
            }else{
                pacman.direction = idle;
            }
            
            break;
        case Right:
            if ([self.laberinto labyrinthAtRow:pacman.row column:pacman.col + 1] != WALL) {
                [pacman moveRight];
            }else{
                pacman.direction = idle;
            }
            
            break;
        case Down:
            if ([self.laberinto labyrinthAtRow:pacman.row + 1 column:pacman.col] != WALL) {
                [pacman moveDown];
            }else{
                pacman.direction = idle;
            }
            
            break;
        case Left:
            if ([self.laberinto labyrinthAtRow:pacman.row  column:pacman.col-1] != WALL) {
                [pacman moveLeft];
            }else{
                pacman.direction = idle;
            }
            
            break;
            
        default:
            break;
    }

    
}


-(void)moveBlinky{
    
    AOGhostNode *blinky = (AOGhostNode*)[self childNodeWithName:@"blinky"];
    
    switch (blinky.direction) {
        case Up:
            if ([self.laberinto labyrinthAtRow:blinky.row  column:blinky.col] == UD || [self.laberinto labyrinthAtRow:blinky.row  column:blinky.col] == RL) {
                [blinky moveUp];
            }else{
                [self moveRandom:blinky];
            }
            
            break;
        case Right:
            if ([self.laberinto labyrinthAtRow:blinky.row  column:blinky.col] == UD || [self.laberinto labyrinthAtRow:blinky.row  column:blinky.col] == RL) {
                [blinky moveRight];
               // NSLog(@"Move right ghost direction %d", blinky.direction);
            }else{
                [self moveRandom:blinky];
            }
            
            break;
        case Down:
            if ([self.laberinto labyrinthAtRow:blinky.row column:blinky.col]  == UD || [self.laberinto labyrinthAtRow:blinky.row column:blinky.col]  == RL) {
                [blinky moveDown];
            }else{
                [self moveRandom:blinky];
            }
            
            break;
        case Left:
            if ([self.laberinto labyrinthAtRow:blinky.row  column:blinky.col] == UD || [self.laberinto labyrinthAtRow:blinky.row  column:blinky.col] == RL) {
                [blinky moveLeft];
            }else{
                [self moveRandom:blinky];
            }
            
            break;
            
        default:
            break;
    }
    
    
}

-(void)moveRandom:(AOGhostNode*)ghost{
    
    
    switch([self.laberinto labyrinthAtRow:ghost.row  column:ghost.col]){
            NSInteger num;
        case UD:
            if(ghost.direction != Down){
                [ghost moveUpNoRes];
                ghost.direction = Up;
            }else{
                [ghost moveDownNoRes];
                ghost.direction = Down;
            }
            
            break;
        case RL:
            if(ghost.direction != Left){
                [ghost moveRightNoRes];
                ghost.direction = Right;
            }else{
                [ghost moveLeftNoRes];
                ghost.direction = Left;
            }
            break;
        case UR:
            if(ghost.direction == Down){
                [ghost moveRightNoRes];
                ghost.direction = Right;
            }else{
                [ghost moveUpNoRes];
                ghost.direction = Up;
            }
            break;
        case RD:
            if(ghost.direction == Up){
                [ghost moveRightNoRes];
                ghost.direction = Right;
            }else{
                [ghost moveDownNoRes];
                ghost.direction = Down;
            }
            break;
        case DL:
            if(ghost.direction == Up){
                [ghost moveLeftNoRes];
                ghost.direction = Left;
            }else{
                [ghost moveDownNoRes];
                ghost.direction = Down;
            }
            break;
        case LU:
            NSLog(@"entre LU ghost direction %d",ghost.direction);
            num = arc4random() % 2;
            if(ghost.direction == Right){
                
                [ghost moveUpNoRes];
                ghost.direction = Up;
               
                
            }else{
                [ghost moveLeftNoRes];
                ghost.direction = Left;
            }
            break;
        case URD:
            switch(ghost.direction){
                    case Down:
                        num = [AOUtil randomWithMin:1 max:3];
                        if(num == 1){
                            [ghost moveRightNoRes];
                            ghost.direction = Right;
                        }else{
                            [ghost moveDownNoRes];
                            ghost.direction = Down;
                        }
                    break;
                    case Left:
                        num = [AOUtil randomWithMin:1 max:3];
                        if(num == 1){
                            [ghost moveUpNoRes];
                            ghost.direction = Up;
                        }else{
                            [ghost moveDownNoRes];
                            ghost.direction = Down;
                        }
                    break;
                    case Up:
                        num = [AOUtil randomWithMin:1 max:3];
                        if(num == 1){
                            [ghost moveUpNoRes];
                            ghost.direction = Up;
                        }else{
                            [ghost moveRightNoRes];
                            ghost.direction = Right;
                        }
                    break;
                    default:
                    break;
            }
            break;
        case RDL:
            switch(ghost.direction){
                case Right:
                    num = [AOUtil randomWithMin:1 max:3];
                    if(num == 1){
                        
                        [ghost moveRightNoRes];
                        ghost.direction = Right;
                        
                    }else{
                        [ghost moveDownNoRes];
                        ghost.direction = Down;
                        
                    }
                    break;
                case Left:
                    num = [AOUtil randomWithMin:1 max:3];
                    NSLog(@" num %d", num);
                    if(num == 1){
                        [ghost moveLeftNoRes];
                        ghost.direction = Left;
                        
                    }else{
                        [ghost moveDownNoRes];
                        ghost.direction = Down;
                        
                    }
                    break;
                case Up:
                    num = [AOUtil randomWithMin:1 max:3];
                    NSLog(@"num %d", num);
                    if(num == 1){
                        [ghost moveLeftNoRes];
                        ghost.direction = Left;
                       
                    }else{
                        [ghost moveRightNoRes];
                        ghost.direction = Right;
                        
                    }
                    break;
                default:
                    break;
            }

            break;
        case DLU:
            switch(ghost.direction){
                case Down:
                    num = [AOUtil randomWithMin:1 max:3];
                    if(num == 1){
                        [ghost moveLeft];
                        ghost.direction = Left;
                       
                    }else{
                        [ghost moveDown];
                        ghost.direction = Down;
                    }
                    break;
                case Right:
                    num = [AOUtil randomWithMin:1 max:3];
                    if(num == 1){
                        [ghost moveUp];
                        ghost.direction = Up;
                    }else{
                        [ghost moveDown];
                        ghost.direction = Down;
                    }
                    break;
                case Up:
                    num = [AOUtil randomWithMin:1 max:3];
                    if(num == 1){
                        [ghost moveUp];
                        ghost.direction = Up;
                    }else{
                        [ghost moveLeft];
                        ghost.direction = Left;
                    }
                    break;
                default:
                    break;
            }

            break;
        case LUR:
            switch(ghost.direction){
                case Down:
                    num = [AOUtil randomWithMin:1 max:3];
                    if(num == 1){
                        [ghost moveRight];
                        ghost.direction = Right;
                    }else{
                        [ghost moveLeft];
                        ghost.direction = Left;
                    }
                    break;
                case Left:
                    num = [AOUtil randomWithMin:1 max:3];
                    if(num == 1){
                        [ghost moveUp];
                        ghost.direction = Up;
                    }else{
                        [ghost moveLeft];
                        ghost.direction = Left;
                    }
                    break;
                case Right:
                    num = [AOUtil randomWithMin:1 max:3];
                    if(num == 1){
                        [ghost moveUp];
                        ghost.direction = Up;
                    }else{
                        [ghost moveRight];
                        ghost.direction = Right;
                    }
                    break;
                default:
                    break;
            }

            break;
        case URDL:
            [ghost moveUp];
            ghost.direction = Up;
            break;
        default:
            break;
    
    }
    
    
}


@end
