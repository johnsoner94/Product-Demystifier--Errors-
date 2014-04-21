//
//  IngredStore.h
//  Homeowner
//
//  Created by Emily Johnson on 2/10/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ingredients;

@interface IngredStore : NSObject
{
    NSMutableArray *allItems;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
    
}

+   (IngredStore *) sharedStore;

- (NSArray *)allItems;
- (Ingredients *)createItem;
- (void) removeItem:(Ingredients *)p;
- (void)moveItemAtIndex:(int)from toIndex:(int)to;
- (NSString *)itemArchivePath;
- (BOOL)saveChanges;
- (void)loadAllItems;


@end
