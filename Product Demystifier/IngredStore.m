//
//  IngredStore.m
//  Product Demystifier
//
//  Created by Emily Johnson on 4/20/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "IngredStore.h"
#import "Ingredients.h"
#import "IconStore.h"

@implementation IngredStore
+ (IngredStore *)sharedStore{
    static IngredStore *sharedStore = nil;
    if(!sharedStore)
        sharedStore = [[super allocWithZone:nil] init];
    
    return sharedStore;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Reload in Homepwner.xcdatamodeld
        model = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        
        // Where does the SQLite file go?
        NSString *path = [self itemArchivePath];
        NSURL *storeURL = [NSURL fileURLWithPath:path];
        
        NSError *error = nil;
        
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            [NSException raise:@"Open failed" format:@"Reason: %@", [error localizedDescription]];
        }
        // Create the managed object context
        context = [[NSManagedObjectContext alloc] init];
        [context setPersistentStoreCoordinator:psc];
        
        // The managed object context can manage undo, but we don't need it
        [context setUndoManager:nil];
        
        [self loadAllItems];
    }
    return self;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (NSArray *)allItems
{
    return allItems;
}

- (Ingredients *)createItem
{
    Ingredients *i = [NSEntityDescription insertNewObjectForEntityForName:@"Ingredients"
                                               inManagedObjectContext:context];
    [allItems addObject:i];
    
    return i;
}

- (void) removeItem:(Ingredients *)p
{
    NSString *key = [p imageKey];
    [[IconStore sharedStore] deleteImageForKey:key];
    [context deleteObject:p];
    [allItems removeObjectIdenticalTo:p];
}

- (void)moveItemAtIndex:(int)from toIndex:(int)to;
{
    if (from == to)
    {
        return;
    }
    
    // Get pointer to object being moved so we can re-insert it
    Ingredients *p = [allItems objectAtIndex:from];
    
    // Remove p from array
    [allItems removeObjectAtIndex:from];
    
    //Insert p in array at new location
    [allItems insertObject:p atIndex:to];
}

- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // Get one and only document directory from that list
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:@"store.data"];
}

- (void)loadAllItems
{
    if (!allItems) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Ingredients"];
        [request setEntity:e];
        
        NSError *error;
        NSArray *result = [context executeFetchRequest:request error:&error];
        if (!result) {
            [NSException raise:@"Fetch failed"
                        format:@"Reason: %@", [error localizedDescription]];
        }
        
        allItems = [[NSMutableArray alloc] initWithArray:result];
    }
}


- (BOOL)saveChanges
{
    // returns success or failure
    NSError *err = nil;
    BOOL successful = [context save:&err];
    if (!successful) {
        NSLog(@"Error saving: %@", [err localizedDescription]);
    }
    return successful;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    BOOL success = [[IngredStore sharedStore] saveChanges];
    if (success)
    {
        NSLog(@"Saved all of the Ingredients");
    }
    else
    {
        NSLog(@"Could not save any of the Ingredients");
    }
}



@end
