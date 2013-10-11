//
//  JBLoginViewController.m
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/11/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import "JBLoginViewController.h"

@interface JBLoginViewController ()

@end

@implementation JBLoginViewController

@synthesize usernameField, passwordField;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
