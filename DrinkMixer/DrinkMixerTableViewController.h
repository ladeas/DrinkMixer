//
//  DrinkMixerTableViewController.h
//  DrinkMixer
//
//  Created by stavro on 3/13/13.
//  Copyright (c) 2013 stavro. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrinkMixerTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@property (nonatomic, retain) NSMutableArray *drinks;


@end
