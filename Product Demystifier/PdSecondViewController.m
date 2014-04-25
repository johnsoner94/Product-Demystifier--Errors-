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
#import "AddIngredientViewController.h"
#import "IngredStore.h"

@interface PdSecondViewController ()
{
    NSMutableArray *_objects;
}
@end

@implementation PdSecondViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle
{
    // Call the superclass's designated initializer
    // Get a pointer to the application bundle object
    NSBundle *appBundle = [NSBundle mainBundle];
    
    self = [super initWithNibName:@"PdSecondViewController"
                           bundle:appBundle];
    
    if (self) {
        // Get the tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        // Give it a label
        [tbi setTitle:@"My Ingredients"];
        
        UIImage *i = [UIImage imageNamed:@"Icon-Small.png"];
        [tbi setImage:i];
        
    }
    return self;
}


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
    Ingredients *i = [[IngredStore sharedStore] createItem];
    [_objects insertObject:i atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    // USE THIS TO CREATE YOUR AddIngredientView
    // create the new object before you present the new view
    // pass the object into the new view as a property
    // modal present a view controller that sets the values
    // once they hit save you need to get the context and save it
    // before you get rid of that view you need to pass back the dismissBlock
    AddIngredientViewController *avc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddIngredient"];
    [avc setDetailItem:i];
    [avc setDismissBlock:^{
        if (avc.detailItem == nil) {
            // delete it using context
            IngredStore *is = [IngredStore sharedStore];
            NSArray *ingreds = [is allItems];
            Ingredients *i = [ingreds objectAtIndex:[indexPath row]];
            [is removeItem:i];
            // remove it from the table/array
            [_objects removeObject:i];
            NSLog(@"After deleting an item allItems has %d items", [[is allItems] count]);
            NSLog(@"After deleting an item _objects has %d items", _objects.count);
        }
        [[self tableView] reloadData];
    }];
    [avc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:avc animated:YES completion:nil];
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
//        [_objects removeObjectAtIndex:indexPath.row];
        IngredStore *is = [IngredStore sharedStore];
        NSArray *ingreds = [is allItems];
        // TODO!! There is something funky going on with your indexPath
        Ingredients *i = [ingreds objectAtIndex:[indexPath row]];
        [is removeItem:i];
        [_objects removeObject:i];
        NSLog(@"After deleting an item allItems has %d items", [[is allItems] count]);
        NSLog(@"After deleting an item _objects has %d items", _objects.count);
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"IngredientView"];
    Ingredients *i = _objects[indexPath.row];
    dvc.detailItem = i;
    [dvc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:dvc animated:YES completion:nil];
}

- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // Use to display your editing/adding page.
    AddIngredientViewController *avc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddIngredient"];
    Ingredients *i = [_objects objectAtIndex:[indexPath row]];
    [avc setDetailItem:i];
    [avc setDismissBlock:^{
        [[self tableView] reloadData];
    }];
    [avc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:avc animated:YES completion:nil];
}

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return NO;
}


@end
