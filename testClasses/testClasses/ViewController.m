//
//  ViewController.m
//  testClasses
//
//  Created by Yifang Zhang on 7/1/15.
//  Copyright (c) 2015 Yifang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dbManager = [[SharedDatabaseManager alloc] init];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)initalizeTable:(id)sender {
    [self.dbManager initalizeTable];
    self.tableStatus.text = [NSString stringWithFormat:@"%ld", (long)self.dbManager.dataTableStatus];
}

- (IBAction)insertTable:(id)sender {
    
    [self.dbManager insertItemIntoTablewithuserID:@"1" andUser:@"wind" andMessage:@"hihi" andSwappCoin:@"100"];
    [self.dbManager insertItemIntoTablewithuserID:@"2" andUser:@"sick people" andMessage:@"sicked x.x" andSwappCoin:@"200"];
    self.tableStatus.text = [NSString stringWithFormat:@"%ld", (long)self.dbManager.dataTableStatus];
    NSArray * haha = [self.dbManager selectItemFromTable];
    NSLog(@"output started:");
    int count = 0;
    for (NSArray * line in haha) {
        if (count == 0) {
            //NSLog(@"here, here, %@", line);
            NSString * temp = [NSString stringWithFormat:@"ID: %@, USERNAME: %@, MESSAGE: %@, SWAPPCOIN: %@", [line objectAtIndex:0], [line objectAtIndex:1], [line objectAtIndex:2], [line objectAtIndex:3]];
            NSLog(@"temp is: %@", temp);
            self.firstVariable.text = temp;
            count = count + 1;
        } else {
            //NSLog(@"here, here, %@", line);
             NSString * temp = [NSString stringWithFormat:@"ID: %@, USERNAME: %@, MESSAGE: %@, SWAPPCOIN: %@", [line objectAtIndex:0], [line objectAtIndex:1], [line objectAtIndex:2], [line objectAtIndex:3]];
            NSLog(@"temp is: %@", temp);
            self.secondVariable.text = temp;
        }
    }
    
}

- (IBAction)replaceTable:(id)sender {
    
    [self.dbManager insertItemIntoTablewithuserID:@"2" andUser:@"there is a name" andMessage:@"cured" andSwappCoin:@"150"];
    
    self.tableStatus.text = [NSString stringWithFormat:@"%ld", (long)self.dbManager.dataTableStatus];
    NSArray * haha = [self.dbManager selectItemFromTable];
    NSLog(@"output started:");
    int count = 0;
    for (NSArray * line in haha) {
        if (count == 0) {
            NSString * temp = [NSString stringWithFormat:@"ID: %@, USERNAME: %@, MESSAGE: %@, SWAPPCOIN: %@", [line objectAtIndex:0], [line objectAtIndex:1], [line objectAtIndex:2], [line objectAtIndex:3]];
            NSLog(@"temp is: %@", temp);
            self.firstVariable.text = temp;
            count = count + 1;
        } else {
            NSString * temp = [NSString stringWithFormat:@"ID: %@, USERNAME: %@, MESSAGE: %@, SWAPPCOIN: %@", [line objectAtIndex:0], [line objectAtIndex:1], [line objectAtIndex:2], [line objectAtIndex:3]];
            NSLog(@"temp is: %@", temp);
            self.secondVariable.text = temp;
        }
    }
    
}
@end
