//
//  CARQuakeViewController.m
//  Quakes-Objc
//
//  Created by Chad Rutherford on 2/20/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARQuakeViewController.h"
#import "CARQuakeFetcher.h"

@interface CARQuakeViewController ()

@property CARQuakeFetcher *quakeFetcher;
@end

@implementation CARQuakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.quakeFetcher = [[CARQuakeFetcher alloc] init];
    [self.quakeFetcher fetchQuakesWithCompletion:^(NSArray * _Nullable quakes, NSError * _Nullable error){
        if (error) {
            NSLog(@"Error fetching quakes: %@", error);
            return;
        }
        
        NSLog(@"Quakes: %@", quakes);
    }];
}

@end
