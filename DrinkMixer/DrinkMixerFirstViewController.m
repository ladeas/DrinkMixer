//
//  DrinkMixerFirstViewController.m
//  DrinkMixer
//
//  Created by stavro on 3/13/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "DrinkMixerFirstViewController.h"


@interface DrinkMixerFirstViewController ()

@end

@implementation DrinkMixerFirstViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.drinks = [[NSMutableArray alloc] initWithObjects:@"Firecracker", @"Lemon Drop", @"Mojito", nil];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.drinks count];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
