//
//  ViewController.h
//  testClasses
//
//  Created by Yifang Zhang on 7/1/15.
//  Copyright (c) 2015 Yifang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedDatabaseManager.h"

@interface ViewController : UIViewController

@property (strong, retain) SharedDatabaseManager * dbManager;

@property (weak, nonatomic) IBOutlet UILabel *tableStatus;
@property (weak, nonatomic) IBOutlet UILabel *firstVariable;
@property (weak, nonatomic) IBOutlet UILabel *secondVariable;

- (IBAction)initalizeTable:(id)sender;
- (IBAction)insertTable:(id)sender;
- (IBAction)replaceTable:(id)sender;


@end

