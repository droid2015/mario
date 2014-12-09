//
//  SKBPlayer.m
//  Supper mario
//
//  Created by Phong CNPM on 11/29/14.
//  Copyright (c) 2014 tigger. All rights reserved.
//

#import "SKBPlayer.h"

@implementation SKBPlayer
+(SKBPlayer *)initNewPlayer:(SKScene *)onScene :(CGPoint)location
{
    SKBSpriteTextures *playerTextures=[[SKBSpriteTextures alloc] init];
    [playerTextures createAnimationTextures];
    //Khởi tạo object
    SKBPlayer *player=[SKBPlayer spriteNodeWithTexture:[SKTexture textureWithImageNamed: kPlayerRunRight1FileName]];
    player.position=location;
    //Tên player
    player.name=@"player1";
    //Khởi tạo các texture
    player.spriteTextures=playerTextures;
    //
    player.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:player.size];
    player.physicsBody.categoryBitMask=kPlayerCategory;
    player.physicsBody.contactTestBitMask=kWallCategory|kBaseCategory;
    player.physicsBody.density=1;//tỷ trọng kg/m2
    player.physicsBody.linearDamping=0.1;//giảm vận tốc tuyến tính, lực ma sát
    player.physicsBody.restitution=0.2;//năng lượng mất đi khi va chạm với cái khác
    //Add node vào scene
    [onScene addChild:player];
    return player;
}
-(void) jump
{
    NSLog(@"jump");
    [self.physicsBody applyImpulse:CGVectorMake(0, kPlayerJumpingIncrement)];
}
-(void)wrapPlayer:(CGPoint)where
{
    SKPhysicsBody *storePB=self.physicsBody;
    self.physicsBody=nil;
    self.position=where;
    self.physicsBody=storePB;
}
-(void)runLeft
{
    _playerStatus=SBPlayerRunningLeft;
    //Tạo các ani walk
    SKAction *walk=[SKAction animateWithTextures:_spriteTextures.playerRunLeftTextures timePerFrame:0.05];
    SKAction *loopForever=[SKAction repeatActionForever:walk];
    [self runAction:loopForever];
    
    SKAction *moveLeft=[SKAction moveByX:-kPlayerRunningIncrement y:0 duration:1];
    SKAction *loopLeft=[SKAction repeatActionForever:moveLeft];
    [self runAction:loopLeft];
}
-(void)runRight
{
    _playerStatus=SBPlayerRunningRight;
    //Tạo các ani walk
    SKAction *walk=[SKAction animateWithTextures:_spriteTextures.playerRunRightTextures timePerFrame:0.05];
    SKAction *loopForever=[SKAction repeatActionForever:walk];
    [self runAction:loopForever];
    //Tạo ani move
    SKAction *moveRight=[SKAction moveByX:kPlayerRunningIncrement y:0 duration:1];
    SKAction *loopRight=[SKAction repeatActionForever:moveRight];
    [self runAction:loopRight];
}

-(void)skidRight
{
    NSLog(@"skid right");
    [self removeAllActions];
    _playerStatus=SBPlayerSkiddingRight;
    NSArray *skidRightTexture=_spriteTextures.playerSkidRightTextures;
    NSArray *stillRightTexture=_spriteTextures.playerStillFacingRightTextures;
    SKAction *skidAnimation=[SKAction animateWithTextures:skidRightTexture timePerFrame:1];
    SKAction *skidAWhile=[SKAction repeatAction:skidAnimation count:0.2];
    
    SKAction *moveLeft=[SKAction moveByX:-kPlayerSkiddingIncrement y:0 duration:0.2];
    SKAction *moveAwhile=[SKAction repeatAction:moveLeft count:1];
    
    SKAction *stillAnimation=[SKAction animateWithTextures:stillRightTexture timePerFrame:1];
    SKAction *stillAWhile=[SKAction repeatAction:stillAnimation count:0.1];
    SKAction *sequence=[SKAction sequence:@[skidAWhile,moveAwhile,stillAWhile]];
    [self runAction:sequence completion:^{
        NSLog(@"skid ended, still facing right");
        _playerStatus=SBPlayerFacingRight;
    }];
    
}
-(void)skidLeft
{
    NSLog(@"skid left");
    [self removeAllActions];
    _playerStatus=SBPlayerSkiddingLeft;
    NSArray *skidLeftTexture=_spriteTextures.playerSkidLeftTextures;
    NSArray *stillLeftTexture=_spriteTextures.playerStillFacingLeftTextures;
    SKAction *skidAnimation=[SKAction animateWithTextures:skidLeftTexture timePerFrame:1];
    SKAction *skidAWhile=[SKAction repeatAction:skidAnimation count:0.2];
    
    SKAction *moveRight=[SKAction moveByX:kPlayerSkiddingIncrement y:0 duration:0.2];
    SKAction *moveAwhile=[SKAction repeatAction:moveRight count:1];
    
    SKAction *stillAnimation=[SKAction animateWithTextures:stillLeftTexture timePerFrame:1];
    SKAction *stillAWhile=[SKAction repeatAction:stillAnimation count:0.1];
    SKAction *sequence=[SKAction sequence:@[skidAWhile,moveAwhile,stillAWhile]];
    [self runAction:sequence completion:^{
        NSLog(@"skid ended, still facing right");
        _playerStatus=SBPlayerFacingLeft;
    }];
}
@end
