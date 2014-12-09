//
//  SKBGameScene.m
//  Supper mario
//
//  Created by Phong CNPM on 11/27/14.
//  Copyright (c) 2014 tigger. All rights reserved.
//

#import "SKBGameScene.h"
#import "SKBPlayer.h"
@implementation SKBGameScene
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch *touch in touches)
    {
        CGPoint location=[touch locationInNode:self];
        if(!_player)
        {
            NSLog(@"init");
            _player=[SKBPlayer initNewPlayer:self : location];
            
        }
        //Nữa trên màn hình, jump
        else if(location.y>=(self.frame.size.height/2))
        {
            NSLog(@"jump");
            [_player jump];
        }
                
        else if(location.x<=(self.frame.size.width/2))
        {
            if(_player.playerStatus==SBPlayerRunningRight)
            {
                NSLog(@"runningright");
                [_player skidRight];
            }
            else if(_player.playerStatus!=SBPlayerRunningLeft)
                [_player runLeft];
        }
        else
        {
            if(_player.playerStatus==SBPlayerRunningLeft)
            {
                NSLog(@"runningLeft");
                [_player skidLeft];
            }
            else if(_player.playerStatus!=SBPlayerRunningRight)
                [_player runRight];
        }
    }
    
}
-(id) initWithSize:(CGSize)size
{
    if(self=[super initWithSize:size])
    {
        self.backgroundColor=[SKColor blackColor];
        self.physicsBody=[SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        //Gán các physics
        self.physicsBody.categoryBitMask=kWallCategory;//
        self.physicsWorld.contactDelegate=self;
        //Load world map
        NSString* fileName=@"";
        if(self.frame.size.width==480)
            fileName=@"Backdrop_480";
        else
            fileName=@"Backdrop_568";
        SKSpriteNode *backdrop=[SKSpriteNode spriteNodeWithImageNamed:fileName];
        backdrop.name=@"backdropnode";
        backdrop.position=CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:backdrop];
        //Khởi tạo brick base
        SKSpriteNode *brickNode=[SKSpriteNode spriteNodeWithImageNamed:@"Base_600"];
        brickNode.name=@"brickBaseNode";
        brickNode.position=CGPointMake(CGRectGetMidX(self.frame), brickNode.size.height/2);
        brickNode.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:brickNode.size];
        brickNode.physicsBody.categoryBitMask=kBaseCategory;
        brickNode.physicsBody.dynamic=NO;
        [self addChild:brickNode];
        
    }
    return self;
}
-(void) didBeginContact:(SKPhysicsContact *)contact
{
    SKPhysicsBody *firstBody,*secondBody;
    if(contact.bodyA.categoryBitMask<contact.bodyB.categoryBitMask)
    {
        firstBody=contact.bodyA;
        secondBody=contact.bodyB;
        
        
    }
    else
    {
        firstBody=contact.bodyB;
        secondBody=contact.bodyA;
    }
    //Lấy tên player
    NSString* firstBodyName=firstBody.node.name;
    
    if((((firstBody.categoryBitMask&kPlayerCategory)!=0)&&((secondBody.categoryBitMask&kBaseCategory)!=0)))
    {
            
    }
    if((((firstBody.categoryBitMask&kPlayerCategory)!=0)&&((secondBody.categoryBitMask&kWallCategory)!=0)))
    {
        if([firstBodyName isEqualToString:@"player1"])
        {
        if(firstBody.node.position.x<20)
        {
            NSLog(@"player contact left edge ");
            [_player wrapPlayer:CGPointMake(self.frame.size.width-10, _player.position.y)];
        }
        else
        {
            NSLog(@"player contact right edge ");
            [_player wrapPlayer:CGPointMake(10, _player.position.y)];
        }
        }
        

    }
}
@end
