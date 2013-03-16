//
//  DrinkDetailViewController.h
//  DrinkMixer
//
//  Created by stavro on 3/14/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrinkDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *ingredientsTextView;
@property (weak, nonatomic) IBOutlet UITextView *directionsTextView;
@property (weak, nonatomic) NSDictionary *drink;

@property (nonatomic, strong) NSString *drinkName;

@end
