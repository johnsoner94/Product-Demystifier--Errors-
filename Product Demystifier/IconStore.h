//
//  IconStore.h
//  Product Demystifier
//
//  Created by Emily Johnson on 4/20/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IconStore : NSObject
{
    NSMutableDictionary *dictionary;
}

+ (IconStore *)sharedStore;

- (void)setImage:(UIImage *)i forKey:(NSString *)s;
- (UIImage *)imageForKey:(NSString *)s;
- (void)deleteImageForKey:(NSString *)s;
- (NSString *)imagePathForKey:(NSString *)key;

@end
