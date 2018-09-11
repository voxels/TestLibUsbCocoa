//
//  ViewController.m
//  TestLibUsbCocoa
//
//  Created by Michael Edgcumbe on 9/10/18.
//  Copyright © 2018 Michael Edgcumbe. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void) viewDidAppear {
    [super viewDidAppear];
    AppDelegate *delegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
    [delegate listUSB];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
