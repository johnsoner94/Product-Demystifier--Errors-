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
        name = @"Ingredient";
        danger = 0;
        desc = @"Detailed Description";
        summary = @"Summary";
    }
    return self;
}

@end

