//
//  AddIngredientViewController.h
//  Product Demystifier
//
//  Created by Emily Johnson on 4/9/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ingredients.h"

@interface AddIngredientViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) Ingredients *currentIngred;

@property (strong, nonatomic) id detailItem;
@property (nonatomic, copy) void (^dismissBlock)(void);
@end
