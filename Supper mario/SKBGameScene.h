//
//  SKBGameScene.h
//  Supper mario
//
//  Created by Phong CNPM on 11/27/14.
//  Copyright (c) 2014 tigger. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SKBAppDelegate.h"
#import "SKBPlayer.h"

@interface SKBGameScene : SKScene<SKPhysicsContactDelegate>
@property(strong,nonatomic) SKBPlayer *player;

@end
