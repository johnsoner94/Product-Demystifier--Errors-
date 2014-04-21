//
//  Ingredients.h
//  Product Demystifier
//
//  Created by Emily Johnson on 4/20/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Ingredients : NSManagedObject
{
    
    NSMutableArray *allItems;
    
}

- (NSArray *)allItems;

@property (nonatomic) double danger;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) UIImage * icon;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) NSString * imageKey;

@end
