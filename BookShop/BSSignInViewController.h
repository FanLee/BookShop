//
//  ViewController.h
//  BookShop
//
//  Created by FanLee on 05.11.14.
//  Copyright (c) 2014 Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property(nonatomic,strong)IBOutlet UITextField *emailTextField;
-(void)textFieldDidBeginEditing:(UITextField *) emailTextField;



@end

