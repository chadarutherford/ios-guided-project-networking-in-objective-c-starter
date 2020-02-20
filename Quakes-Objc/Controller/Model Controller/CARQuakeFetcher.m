//
//  CARQuakeFetcher.m
//  Quakes-Objc
//
//  Created by Chad Rutherford on 2/20/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

#import "CARQuakeFetcher.h"
#import "LSIErrors.h"
#import "LSILog.h"
#import "LSIQuake.h"
#import "LSIQuakeResults.h"
#import "LSIFileHelper.h"

@implementation CARQuakeFetcher

static NSString *const baseURLString = @"https://earthquake.usgs.gov/fdsnws/event/1/query";

- (void) fetchQuakesInTimeInterval:(NSDateInterval *)interval
                        completion:(CARQuakeFetcherCompletion)completion {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:baseURLString];
    NSISO8601DateFormatter *dateFormatter = [[NSISO8601DateFormatter alloc] init];
    NSString *startTimeString = [dateFormatter stringFromDate:interval.startDate];
    NSString *endTimeString = [dateFormatter stringFromDate:interval.endDate];
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"format" value:@"geojson"],
        [NSURLQueryItem queryItemWithName:@"starttime" value:startTimeString],
        [NSURLQueryItem queryItemWithName:@"endtime" value:endTimeString]
    ];
    
    NSURL *url = urlComponents.URL;
    NSLog(@"URL: %@", url);
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        if (!data) {
            NSError *dataError = errorWithMessage(@"Data should not be nil from API request", LSIDataNilError);
            completion(nil, dataError);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(nil, jsonError);
            return;
        }
        
        LSIQuakeResults *quakeResults = [[LSIQuakeResults alloc] initWithDictionary:json];
        if (!quakeResults) {
            NSString *errorMessage = [NSString stringWithFormat:@"Unable to parse JSON object, %@", json];
            NSError *parsingError = errorWithMessage(errorMessage, LSIJSONDecodeError);
            completion(nil, parsingError);
            return;
        }
        
        completion(quakeResults.quakes, nil);
    }] resume];
}

- (void) fetchQuakesWithCompletion:(CARQuakeFetcherCompletion)completion {
    NSDate *endDate = [NSDate date];
    NSDate *startDate = [NSCalendar.currentCalendar dateByAddingUnit:NSCalendarUnitDay value:-7 toDate:endDate options:0];
    NSDateInterval *interval = [[NSDateInterval alloc] initWithStartDate:startDate endDate:endDate];
    [self fetchQuakesInTimeInterval:interval completion:completion];
}

@end
