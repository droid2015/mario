//
//  SKBAppDelegate.h
//  Supper mario
//
//  Created by Phong CNPM on 11/26/14.
//  Copyright (c) 2014 tigger. All rights reserved.
//

#import <UIKit/UIKit.h>
//Các hằng toàn cục
static const uint32_t kPlayerCategory= 0x1<<0;
static const uint32_t kBaseCategory=0x1<<1;
static const uint32_t kWallCategory= 0x1<<2;
@interface SKBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
