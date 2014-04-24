//
//  Ingredients.m
//  Product Demystifier
//
//  Created by Emily Johnson on 4/4/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "Ingredients.h"

@implementation Ingredients

@synthesize name, danger, desc, summary, icon, imageKey;

- (NSArray *)allItems

{
    return allItems;
}

- (id)init

{
    self = [super init];
    if (self)
    {
        name = nil;
        danger = 0;
        desc = nil;
        summary = nil;
    }
    return self;
}

@end

