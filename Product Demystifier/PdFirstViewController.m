//
//  PdFirstViewController.m
//  Product Demystifier
//
//  Created by Emily Johnson on 4/3/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "PdFirstViewController.h"

@interface PdFirstViewController ()

@end

@implementation PdFirstViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    // Call the superclass's designated initializer
    // Get a pointer to the application bundle object
    NSBundle *appBundle = [NSBundle mainBundle];
    
    self = [super initWithNibName:@"PdFirstViewController"
                           bundle:appBundle];
    
    if (self) {
        // Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        // Give it a label
        [tbi setTitle:@"About"];
        
        UIImage *i = [UIImage imageNamed:@"first.png"];
        [tbi setImage:i];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor colorWithRed:202 green:225 blue:255 alpha:1.0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
