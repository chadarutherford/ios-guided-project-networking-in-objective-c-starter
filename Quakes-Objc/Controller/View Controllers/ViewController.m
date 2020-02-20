//
//  ViewController.m
//  Quakes-Objc
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "LSILog.h"
#import "LSIFirstResponder.h"

typedef void (^WeatherCompletion)(int temperature);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSLog(@"Hey Quakes!");
//
//    // How do I create a first responder object?
//    LSIFirstResponder *responder = [[LSIFirstResponder alloc] init];
//
//    NSLog(@"responder: %@", responder);
//    NSLog(@"name: %@", responder.name);
//
//    // Objects will be nil / null
//    // int / float / double / bool will be 0 (NO)
//
//    responder.name = @"John";
//    NSLog(@"name: %@", responder.name);
//
//
//    // Blocks
//    int (^addNumbers)(int a, int b) = ^int(int a, int b) {
//        return a + b;
//    };
//
//    int result = addNumbers(5, 6);
//    NSLog(@"The sum is: %d", result);
//    [self doWorkAndCallCompletion:^(int temperature) {
//        NSLog(@"Finished the work, now updating the UI with %dºF", temperature);
//    }];
//}
//
//- (void)doWorkAndCallCompletion:(WeatherCompletion)completion {
//    NSLog(@"Doing work....");
//    completion(27);
    
    
    
}


@end
