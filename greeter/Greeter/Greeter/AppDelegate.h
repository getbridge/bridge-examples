//
//  AppDelegate.h
//  Greeter
//
//  Created by Sridatta Thatipamala on 6/22/12.
//  Copyright (c) 2012 Flotype Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bridge-ios/bridge.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {

  Bridge* bridge;

}

@property(strong, nonatomic)
    Bridge* bridge;

@property (strong, nonatomic) UIWindow *window;

@end
