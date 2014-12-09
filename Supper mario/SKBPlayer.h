//
//  SKBPlayer.h
//  Supper mario
//
//  Created by Phong CNPM on 11/29/14.
//  Copyright (c) 2014 tigger. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SKBAppDelegate.h"
#import "SKBSpriteTextures.h"
#define kPlayerRunningIncrement 100
#define kPlayerSkiddingIncrement 20
#define kPlayerJumpingIncrement 10
//Định nghĩa kiểu liệt kê
typedef enum:int
{
    SBPlayerFacingLeft=0,
    SBPlayerFacingRight,
    SBPlayerRunningLeft,
    SBPlayerRunningRight,
    SBPlayerSkiddingLeft,
    SBPlayerSkiddingRight
}SBPlayerStatus;


@interface SKBPlayer : SKSpriteNode
//
@property(strong,nonatomic) SKBSpriteTextures *spriteTextures;
@property SBPlayerStatus playerStatus;
+(SKBPlayer*)initNewPlayer:(SKScene*) onScene :(CGPoint)location;
-(void) wrapPlayer:(CGPoint) where;
-(void)runRight;
-(void)runLeft;
-(void)skidRight;
-(void)skidLeft;
-(void)jump;
@end
