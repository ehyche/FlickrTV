//
//  ServiceProvider.m
//  FlickrTVExtension
//
//  Created by Eric Hyche on 11/16/15.
//  Copyright © 2015 Hyche Heirs. All rights reserved.
//

#import "ServiceProvider.h"

@interface ServiceProvider ()

@end

@implementation ServiceProvider


- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark - TVTopShelfProvider protocol

- (TVTopShelfContentStyle)topShelfStyle {
    // Return desired Top Shelf style.
    return TVTopShelfContentStyleSectioned;
}

- (NSArray *)topShelfItems {
    // Create an array of TVContentItems.
    return @[];
}

@end
