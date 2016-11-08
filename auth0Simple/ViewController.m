//
//  ViewController.m
//  auth0Simple
//
//  Created by Admin on 04.11.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
#import <Lock/Lock.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lock = [A0Lock newLock];
    [self.view setBackgroundColor:[UIColor greenColor]];
    //for new commit
    
    
    [self performSelector:@selector(begin) withObject:nil afterDelay:5.0];
    // Do any additional setup after loading the view, typically from a nib.
}

- (id)init {
    self = [super init];
    if (self) {
        _lock = [A0Lock newLock];
    }
    return self;
}

-(void)begin
{
    A0Lock *lock = [[ViewController sharedInstance] lock];
    A0LockViewController *controller = [lock newLockViewController];
    controller.onAuthenticationBlock = ^(A0UserProfile *profile, A0Token *token) {
        // Do something with token & profile. e.g.: save them.
        // And dismiss the ViewController
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    [self presentViewController:controller animated:YES completion:nil];
    
}
+ (ViewController*)sharedInstance {
    static ViewController *sharedApplication = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedApplication = [[self alloc] init];
    });
    return sharedApplication;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
