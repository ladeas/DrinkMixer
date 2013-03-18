//
//  DrinkDetailViewController.m
//  DrinkMixer
//
//  Created by stavro on 3/14/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "DrinkDetailViewController.h"


@interface DrinkDetailViewController ()


@end

@implementation DrinkDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.nameTextField.text = [self.drink objectForKey:NAME_KEY];
    self.directionsTextView.text = [self.drink objectForKey:DIRECTIONS_KEY];
    self.ingredientsTextView.text = [self.drink objectForKey:INGREDIENTS_KEY];
    
    NSLog(@"This is the name of the drink: %@", NAME_KEY);
    NSLog(@"This is the directions for that drink: %@", DIRECTIONS_KEY);
    NSLog(@"These are the ingredients for that drink %@", INGREDIENTS_KEY);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.ingredientsScrollView.contentSize = self.view.frame.size;
    
    
	// Do any additional setup after loading the view.
  //  self.nameTextField.text = self.drinkName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
