//
//  DetailViewController.m
//  Product Demystifier
//
//  Created by Emily Johnson on 4/4/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "DetailViewController.h"
#import "PdSecondViewController.h"



@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController
@synthesize currentIngred;
@synthesize dismissBlock;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}



- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        // Set the properties
        self.nameLabel.text = [self.detailItem name];
        self.sumView.text = [self.detailItem summary];
        self.decrView.text = [self.detailItem desc];
        self.dangerLevel.text = [NSString stringWithFormat:@"%ld", (long)[self.detailItem danger]];
        self.iconView.image = [self.detailItem icon];
        
    }
}
 

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set the text field as the delegate
    //[self.nameLabel setDelegate:self];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
