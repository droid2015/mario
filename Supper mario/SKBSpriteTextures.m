//
//  SKBSpriteTextures.m
//  Supper mario
//
//  Created by Phong CNPM on 11/29/14.
//  Copyright (c) 2014 tigger. All rights reserved.
//

#import "SKBSpriteTextures.h"

@implementation SKBSpriteTextures
-(void)createAnimationTextures
{
    //Walking right
    SKTexture *r1=[SKTexture textureWithImageNamed:kPlayerRunRight1FileName];
    SKTexture *r2=[SKTexture textureWithImageNamed:kPlayerRunRight2FileName];
    SKTexture *r3=[SKTexture textureWithImageNamed:kPlayerRunRight3FileName];
    SKTexture *r4=[SKTexture textureWithImageNamed:kPlayerRunRight4FileName];
    _playerRunRightTextures=@[r1,r2,r3,r4];
    //facing right
    _playerStillFacingRightTextures=@[[SKTexture textureWithImageNamed:kPlayerStillRightFileName]];
    _playerSkidRightTextures=@[[SKTexture textureWithImageNamed:kPlayerSkidRightFileName]];
    //Walking left
    r1=[SKTexture textureWithImageNamed:kPlayerRunLeft1FileName];
    r2=[SKTexture textureWithImageNamed:kPlayerRunLeft2FileName];
    r3=[SKTexture textureWithImageNamed:kPlayerRunLeft3FileName];
    r4=[SKTexture textureWithImageNamed:kPlayerRunLeft4FileName];
    _playerRunLeftTextures=@[r1,r2,r3,r4];
    //facing left
    _playerStillFacingLeftTextures=@[[SKTexture textureWithImageNamed:kPlayerStillLeftFileName]];
    _playerSkidLeftTextures=@[[SKTexture textureWithImageNamed:kPlayerSkidLeftFileName]];
}
@end
