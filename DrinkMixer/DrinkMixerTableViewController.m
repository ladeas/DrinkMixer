//
//  DrinkMixerTableViewController.m
//  DrinkMixer
//
//  Created by stavro on 3/13/13.
//  Copyright (c) 2013 stavro. All rights reserved.
// test

#import "DrinkMixerTableViewController.h"
#import "DrinkDetailViewController.h"
#import "DrinkConstants.h"
#import "AddDrinkViewController.h"

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


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // self.drinks = [[NSMutableArray alloc] initWithObjects:@"Firecracker", @"Lemon Drop", @"Mojito",  nil];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DrinkDirections" ofType:@"plist"];
    self.drinks = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    
    // I don't think I need the following line of code. 
    self.navigationItem.rightBarButtonItem = self.addButton;
    
    
    NSLog(@"%@", self.drinks);
    
    
    // Register for application backgrounding so we can save data
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(writeDrinksToFile:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
    self.tableView.allowsSelectionDuringEditing = YES;
}

- (void)writeDrinksToFile:(NSNotification *)notification
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DrinkDirections" ofType:@"plist"];
    NSLog(@"path: %@", path);
    [self.drinks writeToFile:path atomically:YES];
    
    
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.tableView reloadData];
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
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // this following line of code replaced the code that's on page 181
      //  [self performSegueWithIdentifier:@"manual" sender:self];
    
    if (!self.editing) {
//        DrinkDetailViewController *detailViewController = [[DrinkDetailViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
        DrinkDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DrinkDescription"];
        detailViewController.drink = [self.drinks objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
    else {
//        AddDrinkViewController *editingDrinkViewController = [[AddDrinkViewController alloc] initWithNibName:@"AddDrinkViewController" bundle:nil];
        AddDrinkViewController *editingDrinkViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddDrink"];
        editingDrinkViewController.drink = [self.drinks objectAtIndex:indexPath.row];
        editingDrinkViewController.drinkArray = self.drinks;
        
        UINavigationController *editingNavigationController = [[UINavigationController alloc] initWithRootViewController:editingDrinkViewController];
//       [self presentViewController:editingNavigationController animated:YES];
        [self presentViewController:editingNavigationController animated:YES completion:^{
            
        }];
        
    }
    

    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // delete the row from the data source
        [self.drinks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // this is what the book had, but this is the old way. 
  //  DrinkDetailViewController *detailViewController = [[DrinkDetailViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
    

        // Make sure your segue name in storyboard is the same as this line
        if ([[segue identifier] isEqualToString:@"toDetail"])
        {
            // Get reference to the destination view controller
            DrinkDetailViewController *dvc = (DrinkDetailViewController *)[segue destinationViewController];
            
            
            // Pass any objects to the view controller here, like...
            
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            NSDictionary *drink = self.drinks[path.row];
            
            
            
            NSLog(@"what is the drink name: %@", drink);
            
            // Pass the information to your destination view
        dvc.drink = drink;
          
        }
    
    if ([[segue identifier] isEqualToString:@"addSegue"])
    {
        NSLog(@"the add button was pressed!");
        
        AddDrinkViewController *advc = (AddDrinkViewController *) [segue destinationViewController];
        advc.drinkArray = self.drinks;
        
        
    }
    
    // index of model
    // point to vc (an instance)
    // set properties on that new dvc
    
    
}
    
    
    
    
//    NSIndexPath *path = [self.tableView indexPathForCell:sender];
//    NSString *drinkName = self.drinks[path.row];
//    //NSString *ingredients = [self.drinks[path.row]objectForKey:@"ingredients"];
//    
//    
//    
//    
//    DrinkDetailViewController *dvc = (DrinkDetailViewController *) segue.destinationViewController;
//    
//    dvc.drinkName = drinkName;
//    
//    NSLog(@"The drink name is %@", drinkName);
// 
//    // public properties --. like the drink index for instance
//
    




@end
