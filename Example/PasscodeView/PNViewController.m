// PNViewController.m
// Copyright (c) 2016 Pinn Technologies, Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "PNViewController.h"
#import <PasscodeView/PasscodeView.h>

@interface PNViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField* textField;
@property (weak, nonatomic) IBOutlet PasscodeView* passcodeView;
@property (strong, nonatomic) IBOutlet UIView* toolbarView;
@property (weak, nonatomic) IBOutlet UIButton* loginButton;
@end

@implementation PNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textField.delegate = self;
    [self.textField becomeFirstResponder];
    self.loginButton.layer.cornerRadius = 6.0f;

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (UIView*)inputAccessoryView
{
    return self.toolbarView;
}

- (BOOL)textField:(UITextField*)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string
{
    NSString* fullString = [NSString stringWithFormat:@"%@%@", textField.text, string];
    if ([string isEqualToString:@""]) {
        fullString = [fullString substringToIndex:[fullString length] - 1];
    }
    [self.passcodeView setProgress:fullString.length];
    return YES;
}

@end
