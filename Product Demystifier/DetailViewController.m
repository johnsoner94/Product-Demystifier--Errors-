//
//  DetailViewController.m
//  Product Demystifier
//
//  Created by Emily Johnson on 4/4/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "DetailViewController.h"
#import "PdSecondViewController.h"
#import "AddIngredientViewController.h"



@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController


- (void)configureView
{
    if (self.detailItem) {
        self.nameLabel.text = [self.detailItem name];
        self.dangerLabel.text = [NSString stringWithFormat:@"Danger Level: %.f", 10*[self.detailItem danger]];
        self.sumView.text = [self.detailItem summary];
        self.decrView.text = [self.detailItem desc];

    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
