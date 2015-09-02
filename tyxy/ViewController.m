//
//  ViewController.m
//  tyxy
//
//  Created by newfun on 15/8/22.
//  Copyright (c) 2015年 newfun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    MFMessageComposeViewController *mc;
    NSString *phonenum;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnsend.layer.cornerRadius=5;
//    self.btnsend.layer.borderWidth = 1.0;
//    self.btnsend.layer.borderColor = [UIColor blueColor].CGColor;
    
    NSUserDefaults *sendnum = [NSUserDefaults standardUserDefaults];
    if([sendnum objectForKey:@"phonenum"]){
        phonenum = @"16300";
        self.numselect.selectedSegmentIndex = 1;
    }
    else{
        phonenum = @"10001";
        self.numselect.selectedSegmentIndex = 0;
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendnum:(id)sender {
    NSUserDefaults *sendnum = [NSUserDefaults standardUserDefaults];
    NSInteger Index = self.numselect.selectedSegmentIndex;
    switch (Index)
    {
        case 0:
            phonenum = @"10001";
            [sendnum setObject:nil forKey:@"phonenum"];
            break;
        case 1:
            phonenum = @"16300";
            [sendnum setObject:@"1" forKey:@"phonenum"];
        default:
            break;
    }
}

- (IBAction)action10001:(id)sender {
    [self sendmsg:phonenum];
}

-(void)sendmsg:(NSString*)str{
    if([MFMessageComposeViewController canSendText]){
        mc=[[MFMessageComposeViewController alloc] init];
        //设置委托
        mc.messageComposeDelegate=self;
        //短信内容
        mc.body=[[NSString alloc] initWithUTF8String:"xykdmm" ];
        //设置短信收件方
        mc.recipients=[NSArray arrayWithObject:str];
        
        [mc setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        //        [self showViewController:mc sender:self];
        [self presentViewController:mc animated:YES completion:nil];
    }
    else{
        [self alert:@"当前设备不能发送短信"];
    }
}

//短信发送的处理结果
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    switch (result){
        case MessageComposeResultSent:
            [self alert:@"发送成功"];
            break;
        case MessageComposeResultCancelled:
            [self alert:@"取消发送"];
            break;
        case MessageComposeResultFailed:
            [self alert:@"发送失败"];
            break;
        default:
            [self alert:@"发出错误"];
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    mc = nil;
}

-(void)alert:(NSString*)msg{
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [alertView show];
    [self performSelector:@selector(dimissAlert:) withObject:alertView afterDelay:1.0];
}

- (void) dimissAlert:(UIAlertView *)alert {
    if(alert)     {
        [alert dismissWithClickedButtonIndex:[alert cancelButtonIndex] animated:YES];
    }
}

@end
