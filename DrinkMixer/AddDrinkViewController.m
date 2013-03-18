//
//  AddDrinkViewController.m
//  DrinkMixer
//
//  Created by stavro on 3/16/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "AddDrinkViewController.h"
#import "DrinkConstants.h"

@interface AddDrinkViewController () <UITextFieldDelegate>

@end

@implementation AddDrinkViewController

- (IBAction)cancelButtonTapped:(id)sender
{
    
    NSLog(@"Cancel was tapped");
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

- (IBAction)saveButtonTapped:(id)sender
{
    NSLog(@"Save was tappped");
    
       
    // create a new dictionary for the new values
    NSMutableDictionary *newDrink = [[NSMutableDictionary alloc] init];
    [newDrink setValue:self.nameTextField.text forKey:NAME_KEY];
    [newDrink setValue:self.ingredientsTextView.text forKey:INGREDIENTS_KEY];
    [newDrink setValue:self.directionsTextView.text forKey:DIRECTIONS_KEY];
    
    // add it to the master drink array
    // add newDrink dictionary to drinkArray
    [self.drinkArray addObject:newDrink];
    
    // sort the array since we just added a new drink
    NSSortDescriptor *namesorter = [[NSSortDescriptor alloc] initWithKey:NAME_KEY ascending:YES selector:@selector(caseInsensitiveCompare:)];
    [self.drinkArray sortUsingDescriptors:[NSArray arrayWithObject:namesorter]];
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    if (self.drink != nil) {
        // we're working with an existing drink, so let's remove it from the array to get ready for a new one
        [self.drinkArray removeObject:self.drink];
        self.drink = nil;
    }
    
    

}

- (IBAction)textFieldDoneEditing:(id)sender
{
  // [sender resignFirstResponder];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSLog(@"Registering for keyboard events");
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    NSLog(@"Received UIkeyboardDidShowNotification");
}

- (void)keyboardDidHide:(NSNotificationCenter *) notification
{
    NSLog(@"Received UIKeyboardDidHideNotification");
    
    self.keyboardVisible = NO;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"Unregistering for keyboard events");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
