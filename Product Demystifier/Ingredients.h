//
//  Ingredients.h
//  Product Demystifier
//
//  Created by Emily Johnson on 4/4/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ingredients : NSObject
{
    NSMutableArray *allItems;
}

- (NSArray *)allItems;

@property (nonatomic, weak) UIImage *icon;
@property (nonatomic, weak) NSString *name;
@property (nonatomic, weak) NSString *summary;
@property (nonatomic, weak) NSString *desc;
@property (nonatomic) NSInteger danger;

@end
