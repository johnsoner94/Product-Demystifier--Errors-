//
//  DetailViewController.h
//  Product Demystifier
//
//  Created by Emily Johnson on 4/4/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ingredients.h"

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *sumView;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *dangerLevel;
@property (weak, nonatomic) IBOutlet UITextView *decrView;

@property (nonatomic, strong) Ingredients *currentIngred;
@property (nonatomic, copy) void (^dismissBlock)(void);

@end
