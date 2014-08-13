//
//  ViewController.m
//  badge
//
//  Created by Ciao Chiang on 8/5/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "ViewController.h"
#import "CCBadgeView.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *no;
@property (strong, nonatomic) UIView *badgeView;
@property (strong, nonatomic) UILabel *label;

@property (strong, nonatomic) IBOutlet CCBadgeView *badge;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

    
    self.badgeView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 20, 20)];
    [self.badgeView setBackgroundColor: [UIColor redColor]];
    [self.badgeView.layer setCornerRadius:10.0];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [self.label setTextAlignment:NSTextAlignmentCenter];
    [self.label setTextColor:[UIColor whiteColor]];
    [self.label setText:@"6"];
    
    [self.badgeView addSubview:self.label];
    [self.view addSubview:self.badgeView];
    
}
- (IBAction)change:(id)sender{
//    [self.label setText:self.no.text];
//    CGSize textSize = [[self.label text] sizeWithAttributes:@{NSFontAttributeName:[self.label font]}];
//    CGFloat width = (textSize.width < 18)?20:textSize.width+8;
//    self.badgeView.frame = CGRectMake(100, 100, width, 20);
//    self.label.frame = CGRectMake(0, 0, width, 20);
    
    [self.badge setBadgeNumber:[self.no.text intValue]];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
