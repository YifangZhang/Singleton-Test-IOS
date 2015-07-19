//
//  ViewController.h
//  uploadMutiImages
//
//  Created by Yifang Zhang on 7/18/15.
//  Copyright (c) 2015 Yifang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface ViewController : UIViewController <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *image1;
@property (weak, nonatomic) IBOutlet UIButton *image2;
@property (weak, nonatomic) IBOutlet UIButton *image3;
@property (weak, nonatomic) IBOutlet UIButton *image4;
@property NSMutableArray * imageArray;
@property NSInteger intButton;

- (IBAction)selectImages:(id)sender;
- (IBAction)postImages:(id)sender;

@end

