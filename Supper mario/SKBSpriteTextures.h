//
//  SKBSpriteTextures.h
//  Supper mario
//
//  Created by Phong CNPM on 11/29/14.
//  Copyright (c) 2014 tigger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#define kPlayerStillRightFileName @"Player_Right_Still.png"
#define kPlayerSkidRightFileName @"Player_RightSkid.png"
#define kPlayerRunRight1FileName @"Player_Right1.png"
#define kPlayerRunRight2FileName @"Player_Right2.png"
#define kPlayerRunRight3FileName @"Player_Right3.png"
#define kPlayerRunRight4FileName @"Player_Right4.png"

#define kPlayerRunLeft1FileName @"Player_Left1.png"
#define kPlayerRunLeft2FileName @"Player_Left2.png"
#define kPlayerRunLeft3FileName @"Player_Left3.png"
#define kPlayerRunLeft4FileName @"Player_Left4.png"
#define kPlayerStillLeftFileName @"Player_Left_Still.png"
#define kPlayerSkidLeftFileName @"Player_LeftSkid.png"
@interface SKBSpriteTextures : NSObject
@property (strong,nonatomic) NSArray *playerRunRightTextures,*playerStillFacingRightTextures,*playerSkidRightTextures;
@property (strong,nonatomic) NSArray *playerRunLeftTextures,*playerStillFacingLeftTextures,*playerSkidLeftTextures;
-(void) createAnimationTextures;
@end
