//
//  ServiceProvider.m
//  FlickrTVExtension
//
//  Created by Eric Hyche on 11/16/15.
//  Copyright © 2015 Hyche Heirs. All rights reserved.
//

#import "ServiceProvider.h"
#import <FlickrKit/FlickrKit.h>

typedef void (^TVContentItemCompletionBlock)(NSArray *contentItems, NSError *error);


@interface ServiceProvider ()

@property(nonatomic, retain) FKFlickrNetworkOperation *todaysInterestingOp;
@property(nonatomic, copy) NSMutableArray *mutableTopShelfItems;

@end

@implementation ServiceProvider


- (instancetype)init {
    self = [super init];
    if (self) {
        _mutableTopShelfItems = [NSMutableArray array];
        [[FlickrKit sharedFlickrKit] initializeWithAPIKey:@"41eb8fb8939efa9df7708f968f862982" sharedSecret:@"9735878b33384ae1"];
        [self loadInsetItemsWithCompletion:^(NSArray *contentItems, NSError *error) {
            if (contentItems.count > 0) {
                [self.mutableTopShelfItems setArray:contentItems];
                [[NSNotificationCenter defaultCenter] postNotificationName:TVTopShelfItemsDidChangeNotification object:nil];
            }
        }];
    }
    return self;
}

#pragma mark - TVTopShelfProvider protocol

- (TVTopShelfContentStyle)topShelfStyle {
    return TVTopShelfContentStyleInset;
}

- (NSArray *)topShelfItems {
    // Create an array of TVContentItems.
    return [self.mutableTopShelfItems copy];
}

- (void)loadInsetItemsWithCompletion:(TVContentItemCompletionBlock)completionBlock {
    FKFlickrInterestingnessGetList *interesting = [[FKFlickrInterestingnessGetList alloc] init];
    interesting.per_page = @"5";
    self.todaysInterestingOp = [[FlickrKit sharedFlickrKit] call:interesting
                                                      completion:^(NSDictionary *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSArray *contentItems = @[];
            if (response) {
                NSMutableArray *tmpContentItems = [NSMutableArray array];
                for (NSDictionary *photoDictionary in [response valueForKeyPath:@"photos.photo"]) {
                    NSURL *url = [[FlickrKit sharedFlickrKit] photoURLForSize:FKPhotoSizeLarge1600 fromPhotoDictionary:photoDictionary];
                    NSString *photoID = photoDictionary[@"id"];
                    TVContentIdentifier *contentID = [[TVContentIdentifier alloc] initWithIdentifier:photoID container:nil];
                    TVContentItem *contentItem = [[TVContentItem alloc] initWithContentIdentifier:contentID];
                    contentItem.imageURL = url;
                    contentItem.imageShape = TVContentItemImageShapeExtraWide;
                    [tmpContentItems addObject:contentItem];
                }
                if (tmpContentItems.count > 0) {
                    contentItems = [NSArray arrayWithArray:tmpContentItems];
                }
            }
            if (completionBlock) {
                completionBlock(contentItems, error);
            }
        });				
    }];

}

@end
