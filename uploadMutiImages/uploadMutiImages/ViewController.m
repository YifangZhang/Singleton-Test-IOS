//
//  ViewController.m
//  uploadMutiImages
//
//  Created by Yifang Zhang on 7/18/15.
//  Copyright (c) 2015 Yifang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Upload Images";
    self.imageArray = [[NSMutableArray alloc] init];
    self.image1.tag = 1;
    self.image2.tag = 2;
    self.image3.tag = 3;
    self.image4.tag = 4;
    self.counter = 0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectImages:(id)sender {
    NSLog(@"select image");
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select Image from..." delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Image Gallary", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    actionSheet.alpha=0.90;
    actionSheet.tag = 1;
    [actionSheet showInView:self.view];
    //[actionSheet release];
    UIButton *btn = (UIButton *)sender;
    self.intButton = btn.tag;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (actionSheet.tag)
    {
        case 1:
            switch (buttonIndex)
        {
            case 0:
            {
#if TARGET_IPHONE_SIMULATOR
                
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Camera not available." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                //[alert release];
                
#elif TARGET_OS_IPHONE
                
                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.delegate = self;
                //picker.allowsEditing = YES;
                [self presentModalViewController:picker animated:YES];
                //[picker release];
                
#endif
            }
                break;
            case 1:
            {
                UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                picker.delegate = self;
                //[self presentModalViewController:picker animated:YES];
                [self presentViewController:picker animated:YES completion:nil];
                //[picker release];
            }
                break;
        }
            break;
            
        default:
            break;
    }
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    NSData *dataImage = UIImageJPEGRepresentation([info objectForKey:@"UIImagePickerControllerOriginalImage"],0.5);
    UIImage *img = [[UIImage alloc] initWithData:dataImage];
    
    if (self.intButton == 1) {
        [self.image1 setBackgroundImage:img forState:UIControlStateNormal];
        [self.image1 setImage:nil forState:UIControlStateNormal];
    }
    else if (self.intButton == 2) {
        [self.image2 setBackgroundImage:img forState:UIControlStateNormal];
        [self.image2 setImage:nil forState:UIControlStateNormal];
    }
    else if (self.intButton == 3) {
        [self.image3 setBackgroundImage:img forState:UIControlStateNormal];
        [self.image3 setImage:nil forState:UIControlStateNormal];
    }
    else {
        [self.image4 setBackgroundImage:img forState:UIControlStateNormal];
        [self.image4 setImage:nil forState:UIControlStateNormal];
    }
    [self.imageArray addObject:dataImage];
    //[picker dismissModalViewControllerAnimated:YES];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    //[self.navigationController dismissModalViewControllerAnimated:YES];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)postImages:(id)sender {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //上传的字典
    //NSDictionary *parameters = @{@"orderno":@"1419486171570"};
    //上传的本地路径
    //NSURL *filePath = [NSURL fileURLWithPath:_imgPath];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    //上传的网上路径
    [manager POST:@"http://www.code-desire.com.tw/LiMao/Upload/Yifang/testUpload.php" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //上传图片的本地路径和上传图片的文件名
        //NSInteger * counter = 0;
        for (NSData *imageData in self.imageArray) {
            [formData appendPartWithFileData:imageData name:[NSString stringWithFormat:@"image%ld", (long)self.counter] fileName:[NSString stringWithFormat:@"image%ld.jpg", (long)self.counter] mimeType:@"image/jpeg"];
            self.counter = self.counter + 1;
        }
        //[formData appendPartWithFileURL:filePath name:@"rpf" error:nil];
        // NSLog(@"%@",filePath);
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        //NSString *message = responseObject[@"message"];
        //NSLog(@"message:%@",message);
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Message" message:@"successfully upload" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
        self.imageArray = [[NSMutableArray alloc] init];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Message" message:@"failed to upload" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
        self.imageArray = [[NSMutableArray alloc] init];
    }];
    
}
@end
