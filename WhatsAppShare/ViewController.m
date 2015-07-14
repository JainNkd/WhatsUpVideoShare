//
//  ViewController.m
//  WhatsAppShare
//
//  Created by Naveen Kumar Dungarwal on 7/14/15.
//  Copyright (c) 2015 Naveen Kumar Dungarwal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIDocumentInteractionController *documentationInteractionController;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    
    if ([[UIApplication sharedApplication] canOpenURL: [NSURL URLWithString:@"whatsapp://app"]]){
        
        NSString *savePath = [[NSBundle mainBundle] pathForResource:@"1433089596VID_20150111_160819705" ofType:@"mp4"];
        
        documentationInteractionController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:savePath]];
        
        documentationInteractionController.UTI = @"net.whatsapp.movie";
        
        documentationInteractionController.delegate = (id)self;
        
        [documentationInteractionController presentOpenInMenuFromRect:CGRectMake(0, 0, 0, 0) inView:self.view animated: YES];
    } else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"WhatsApp Not Installed." message:@" WhatsApp is not installed on your device." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
