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

@end

@implementation DetailViewController
@synthesize currentIngred;
@synthesize dismissBlock;

/*#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        // YOU TRIED TO UPDATE THE VIEW BEFORE IT WAS CREATED
        // [self configureView];
    }
}

- (IBAction)urgencyValueChanged:(id)sender
{
    UISlider *s = sender;
    [self.urgencyLabel setText: [NSString stringWithFormat:@"Urgency: %.f", s.value*10]];
}

- (IBAction)saved:(id)sender
{
    [self.detailItem setTaskName:[self.taskName text]];
    [self.detailItem setUrgency:[self.urgencySlider value]];
    [self.detailItem setDueDate:[self.datePicker date]];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:[self dismissBlock]];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.taskName.text = [self.detailItem taskName];
        self.urgencySlider.value = [self.detailItem urgency];
        self.urgencyLabel.text = [NSString stringWithFormat:@"Urgency: %.f",[self.detailItem urgency]*10];
        self.datePicker.date = [self.detailItem dueDate];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set the text field as the delegate
    [self.taskName setDelegate:self];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}*/





@end
