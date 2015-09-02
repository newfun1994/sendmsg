//
//  ViewController.h
//  tyxy
//
//  Created by newfun on 15/8/22.
//  Copyright (c) 2015年 newfun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController<MFMessageComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnsend;

@property (weak, nonatomic) IBOutlet UISegmentedControl *numselect;

- (IBAction)sendnum:(id)sender;

@end

