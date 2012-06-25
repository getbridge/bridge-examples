//
//  ViewController.m
//  Greeter
//
//  Created by Sridatta Thatipamala on 6/22/12.
//  Copyright (c) 2012 Flotype Inc. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "bridge-ios/bridge.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (IBAction)greetingButtonPressed:(id)sender {
  AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
  Bridge* bridge = [delegate bridge];
  BridgeRemoteObject* greeter = [bridge getService:@"greeter"];
  [greeter greet:@"iPhone" :[BridgeCallback callbackWithBlock:^(NSArray * args) {
    NSString* text = [args objectAtIndex:0];
    UITextView* textView = (UITextView*) [[self view] viewWithTag:1];
    [textView setText:text];
  }]]; 
}

@end
