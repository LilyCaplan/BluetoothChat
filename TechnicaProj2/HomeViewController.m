//
//  ViewController.m
//  TechnicaProj2
//
//  Created by Saad Khalid on 11/4/17.
//  Copyright © 2017 Saad Khalid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"a button" forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 50, 100, 30);
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed {
    NSLog(@"button pressed");
}

@end
