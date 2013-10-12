//
//  NViewController.m
//  NumberSorter2
//
//  Created by Alexis Matherlee on 10/10/13.
//  Copyright (c) 2013 Alexis Matherlee. All rights reserved.
//

#import "NViewController.h"

@interface NViewController ()

@property (strong, nonatomic) NSMutableArray *list;

@end

@implementation NViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.list = [[NSMutableArray alloc] init];
}
- (IBAction)submit:(id)sender {
    NSLog(@"%@", self.guess.text);
    [self.list addObject: self.guess.text];
    self.numberLabel.text = [self.list componentsJoinedByString:@" , "];
    self.guess.text = @"";
}
- (IBAction)sort:(id)swithender {
    [self.list sortUsingComparator: ^NSComparisonResult(NSString *str1, NSString *str2) {
        return [str1 compare: str2 options: (NSNumericSearch)];
    }];
    NSLog(@"%@", self.list);
    NSString *str = [self.list componentsJoinedByString:@", "];
    self.sortedNumberLabel.text = str;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
