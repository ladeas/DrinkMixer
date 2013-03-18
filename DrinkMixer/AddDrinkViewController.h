//
//  AddDrinkViewController.h
//  DrinkMixer
//
//  Created by stavro on 3/16/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import "DrinkDetailViewController.h"

@interface AddDrinkViewController : DrinkDetailViewController

- (void)keyboardDidShow:(NSNotification *)notification;
- (void)keyboardDidHide:(NSNotificationCenter *) notification;

@property BOOL keyboardVisible;

@property (nonatomic, strong) NSMutableArray *drinkArray;




@end
