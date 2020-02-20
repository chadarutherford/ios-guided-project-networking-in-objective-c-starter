//
//  CARQuakeFetcher.h
//  Quakes-Objc
//
//  Created by Chad Rutherford on 2/20/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CARQuakeFetcherCompletion)(NSArray * _Nullable quakes, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface CARQuakeFetcher : NSObject

- (void)fetchQuakesInTimeInterval:(NSDateInterval *)interval
                       completion:(CARQuakeFetcherCompletion)completion;

- (void) fetchQuakesWithCompletion:(CARQuakeFetcherCompletion)completion;
@end

NS_ASSUME_NONNULL_END
