//
//  ViewController.m
//  BounceNumber
//
//  Created by JustinChou on 16/6/27.
//  Copyright © 2016年 JustinChou. All rights reserved.
//

#import "ViewController.h"
#import "PanelView.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *inputNumberTextField;
@property (nonatomic, strong) PanelView *panelView;
@property (nonatomic, strong) UIButton *changeNumberButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI {

    PanelView *demoPanel = [[PanelView alloc] initWithFrame:CGRectMake(50, 100, 70, 40)];
    self.panelView = demoPanel;
    self.panelView.digitNumber = 7;
    demoPanel.number = @"0000000";
    [self.view addSubview:demoPanel];
    
    self.inputNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, 200, 30)];
    self.inputNumberTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.inputNumberTextField.placeholder = @"please input number...";
    [self.view addSubview:self.inputNumberTextField];
    
    self.changeNumberButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 0, 0)];
    [self.changeNumberButton setBackgroundColor:[UIColor greenColor]];
    [self.changeNumberButton setTitle:@"click me" forState:UIControlStateNormal];
    [self.changeNumberButton sizeToFit];
    [self.changeNumberButton addTarget:self action:@selector(didClickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.changeNumberButton];
}

- (void)didClickButton {
    if ([self.inputNumberTextField.text length] == 0) {
        NSLog(@"please input number!");
    } else {
        NSString *number = self.inputNumberTextField.text;
        NSLog(@"%@", number);
        self.panelView.number = number;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
