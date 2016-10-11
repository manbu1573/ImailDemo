//
//  ViewController.m
//  imail
//
//  Created by 李荣建 on 2016/10/11.
//  Copyright © 2016年 李荣建. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>

@interface ViewController ()<MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *sendMassage;
@property (nonatomic,strong) MFMailComposeViewController *mailComposer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)sendMassage:(UIButton *)sender {
    _mailComposer = [[MFMailComposeViewController alloc]init];
    _mailComposer.mailComposeDelegate = self;
    [_mailComposer setSubject:@"Test mail"];
    [_mailComposer setMessageBody:@"Testing message for the test mail" isHTML:NO];
     [self showViewController:_mailComposer sender:nil];
}

#pragma mark - mail compose delegate
-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (result) {
        NSLog(@"Result : %d",result);
    }
    if (error) {
        NSLog(@"Error : %@",error);
    }
    [self dismissModalViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
