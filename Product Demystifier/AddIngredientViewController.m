//
//  AddIngredientViewController.m
//  Product Demystifier
//
//  Created by Emily Johnson on 4/9/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "AddIngredientViewController.h"

@interface AddIngredientViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addNameTextField;
@property (weak, nonatomic) IBOutlet UISlider *dangerLevelSlider;
@property (weak, nonatomic) IBOutlet UILabel *dangerLevelLabel;
@property (weak, nonatomic) IBOutlet UITextField *summaryTextField;
@property (weak, nonatomic) IBOutlet UITextView *descripTextView;

- (IBAction)saved:(id)sender;
- (IBAction)cancelled:(id)sender;
- (IBAction)dangerSliderChanged:(id)sender;

@end

@implementation AddIngredientViewController
@synthesize dismissBlock, dangerLevelSlider;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.addNameTextField setDelegate:self];
    [self.summaryTextField setDelegate:self];
    [dangerLevelSlider setMaximumTrackTintColor:[UIColor colorWithRed:0 green:128 blue:0 alpha:0.5]];
    [dangerLevelSlider setMinimumTrackTintColor:[UIColor colorWithRed:220 green:20 blue:60 alpha:0.5]];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.addNameTextField.text = [self.detailItem name];
        self.dangerLevelSlider.value = [self.detailItem danger];
        self.summaryTextField.text = [self.detailItem summary];
        self.descripTextView.text = [self.detailItem desc];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saved:(id)sender {
    [self.detailItem setName:[self.addNameTextField text]];
    [self.detailItem setDanger:[self.dangerLevelSlider value]];
    [self.detailItem setSummary:[self.summaryTextField text]];
    [self.detailItem setDesc:[self.descripTextView text]];
    // Later you'll set the icon using the danger level, once you have images to work with
    // You may need to add this new item to the array of ingredients
    [self.presentingViewController dismissViewControllerAnimated:YES completion:[self dismissBlock]];
}

- (IBAction)cancelled:(id)sender {
    // You may need to remove this item from the array of ingredients
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    // delete object here?
}

- (IBAction)dangerSliderChanged:(id)sender {
    UISlider *s = sender;
    [self.dangerLevelLabel setText: [NSString stringWithFormat:@"Danger Level: %.f", s.value*10]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
