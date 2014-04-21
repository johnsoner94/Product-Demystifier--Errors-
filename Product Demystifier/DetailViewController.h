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
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UITextView *sumView;
@property (weak, nonatomic) IBOutlet UILabel *dangerLabel;
@property (weak, nonatomic) IBOutlet UITextView *decrView;
- (IBAction)backPressed:(id)sender;

@property (nonatomic, retain) Ingredients *currentIngred;

@property (nonatomic, retain) id detailItem;



@end
