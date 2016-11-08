//
//  ViewController.h
//  auth0Simple
//
//  Created by Admin on 04.11.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class A0Lock;

@interface ViewController : UIViewController

@property (readonly, nonatomic) A0Lock *lock;

+ (ViewController *)sharedInstance;

@end

