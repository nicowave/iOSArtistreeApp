//
//  SignUpViewController.h
//  artistreeApp
//
//  Created by Nicolas Roldos on 6/13/14.
//  Copyright (c) 2014 Artistree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)signUp:(id)sender;

@end
