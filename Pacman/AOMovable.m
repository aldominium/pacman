//
//  AOMovable.m
//  Pacman
//
//  Created by Aldo Olivares Dominguez on 03/09/14.
//  Copyright (c) 2014 Aldominium. All rights reserved.
//

#import "AOMovable.h"
#import "AOUtil.h"

@interface AOMovable ()



@end

@implementation AOMovable



-(void)moveUp{
    
    if (self.canMove) {
        SKAction *move = [SKAction moveBy:CGVectorMake(0, 13) duration:AOPacmanSpeed];
        self.canMove = NO;
        
        
        [self runAction:move completion:^{
            self.canMove = YES;
        }];
        
        self.row--;
        
    }
    
    
}

-(void)moveDown{
    if (self.canMove) {
        SKAction *move = [SKAction moveBy:CGVectorMake(0, -13) duration:AOPacmanSpeed];
        
        
        self.canMove = NO;
        
        
        [self runAction:move completion:^{
            self.canMove = YES;
        }];
        
        
        self.row++;
    }
    
}

-(void)moveRight{
    if (self.canMove) {
        SKAction *move = [SKAction moveBy:CGVectorMake(13, 0) duration:AOPacmanSpeed];
        
        self.canMove = NO;
        
        
        [self runAction:move completion:^{
            self.canMove = YES;
        }];
        
        self.col++;
    }
    
}

-(void)moveLeft{
    
    if (self.canMove) {
        SKAction *move = [SKAction moveBy:CGVectorMake(-13, 0) duration:AOPacmanSpeed];
        
        self.canMove = NO;
        
        
        [self runAction:move completion:^{
            self.canMove = YES;
        }];
        
        self.col--;
    }
}

-(void)moveRightSlow{
    if (self.canMove) {
        SKAction *move = [SKAction moveBy:CGVectorMake(13, 0) duration:.6];
        
        self.canMove = NO;
        
        
        [self runAction:move completion:^{
            self.canMove = YES;
        }];
        
        self.col++;
    }
    
}

-(void)moveLeftSlow{
    
    if (self.canMove) {
        SKAction *move = [SKAction moveBy:CGVectorMake(-13, 0) duration:.6];
        
        self.canMove = NO;
        
        
        [self runAction:move completion:^{
            self.canMove = YES;
        }];
        
        self.col--;
    }
}

-(void)moveUpNoRes{
    
    
    SKAction *move = [SKAction moveBy:CGVectorMake(0, 13) duration:AOPacmanSpeed];
    self.direction = Up;
    
    [self runAction:move completion:^{
        self.row--;
    }];
    
    
    
    
}



-(void)moveDownNoRes{
    
    SKAction *move = [SKAction moveBy:CGVectorMake(0, -13) duration:AOPacmanSpeed];
    self.direction = Down;
    
        
        
    [self runAction:move completion:^{
        self.row++;
    }];
    
    
}

-(void)moveRightNoRes{
    
    SKAction *move = [SKAction moveBy:CGVectorMake(13, 0) duration:AOPacmanSpeed];
    self.direction = Right;
    
        
        
    [self runAction:move completion:^{
        self.col++;
    }];
    
    
}

-(void)moveLeftNoRes{
    
    SKAction *move = [SKAction moveBy:CGVectorMake(-13, 0) duration:AOPacmanSpeed];
        
    self.direction = Left;
        
        
    [self runAction:move completion:^{
        self.col--;
    }];
        
    
    
}





@end
