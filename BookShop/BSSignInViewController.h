//
//  BSSignInViewController.h
//  BookShop
//
//  Created by FanLee on 05.11.14.
//  Copyright (c) 2014 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSSignInViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic,strong) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (nonatomic,strong) IBOutlet UITextField *passTextField;
- (IBAction)signInAction:(id)sender;


@end

