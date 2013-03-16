//
//  DrinkMixerTableViewController.m
//  DrinkMixer
//
//  Created by stavro on 3/13/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "DrinkMixerTableViewController.h"
#import "DrinkDetailViewController.h"
#import "DrinkConstants.h"

@interface DrinkMixerTableViewController ()

@end

@implementation DrinkMixerTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)addButtonPressed:(id)sender
{
    NSLog(@"Add button pressed");
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // self.drinks = [[NSMutableArray alloc] initWithObjects:@"Firecracker", @"Lemon Drop", @"Mojito",  nil];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DrinkDirections" ofType:@"plist"];
    self.drinks = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    
    // I don't think I need the following line of code. 
    self.navigationItem.rightBarButtonItem = self.addButton;
    
    
    NSLog(@"%@", self.drinks);
    
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.drinks count];
    
    // Return the number of rows in the section.
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[self.drinks objectAtIndex:indexPath.row]objectForKey:NAME_KEY];
    
    
    // in the book the following line of code is: cell.accessoryType = UITableViewCellAccessoryDetailDisclosureIndicator;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton; 
    
    // Configure the cell...
    
    return cell;
 
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // this following line of code replaced the code that's on page 181
      //  [self performSegueWithIdentifier:@"manual" sender:self];
    DrinkDetailViewController *detailViewController = [[DrinkDetailViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
    
    
    detailViewController.drink = [self.drinks objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:detailViewController animated:YES];

    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    NSIndexPath *path = [self.tableView indexPathForCell:sender];
//    NSString *drinkName = self.drinks[path.row];
//    
//    
//    
//    DrinkDetailViewController *dvc = (DrinkDetailViewController *) segue.destinationViewController;
//    
//    dvc.drinkName = drinkName;
    
    
    // public properties --. like the drink index for instance

    
}



@end
