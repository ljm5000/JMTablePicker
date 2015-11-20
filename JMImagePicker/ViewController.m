//
//  ViewController.m
//  JMImagePicker
//
//  Created by 梁继明 on 15/11/12.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "ViewController.h"
#import "JMPickerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushAction:(id)sender {
    
    JMPickerViewController *vc = [[JMPickerViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
