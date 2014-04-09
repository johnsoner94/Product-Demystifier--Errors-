//
//  PdSecondViewController.m
//  Product Demystifier
//
//  Created by Emily Johnson on 4/3/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "PdSecondViewController.h"
#import "DetailViewController.h"
#import "Ingredients.h"

@interface PdSecondViewController ()
{
    NSMutableArray *_objects;
}
@end

@implementation PdSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"My Ingredients"];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshView:) name:@"DetailDone" object:nil];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    [self.tableView setDelegate:self];
}

- (void) refreshView:(NSNotification *)notification {
    [self.tableView reloadData];
}


- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[[Ingredients alloc] init] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    // USE THIS TO CREATE YOUR AddIngredientView
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Ingredients *i = _objects[indexPath.row];
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    [cell.textLabel setText: i.name];
    [cell.detailTextLabel setText: i.summary];
    // It's very possible that this line of code is wrong.
    [cell.imageView setImage:i.icon];
    [cell.detailTextLabel setBackgroundColor:[UIColor clearColor]];
    [cell.textLabel setBackgroundColor:[UIColor clearColor]];
    

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"IngredientView"];
    Ingredients *i = [_objects objectAtIndex:[indexPath row]];
    [dvc setDetailItem:i];
    [dvc setDismissBlock:^{
        [[self tableView] reloadData];
    }];
    [dvc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:dvc animated:YES completion:nil];
}

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return NO;
}


@end
