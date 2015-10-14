//
//  Tool-Objective-C.m
//  eXoHybrid
//
//  Created by Nguyen Manh Toan on 9/30/15.
//  Copyright © 2015 eXo. All rights reserved.
//

#import "Tool-Objective-C.h"
#import <QuartzCore/QuartzCore.h>


#define EXO_TEXT_FIELD_PADDING_WIDTH 30

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation Tool_Objective_C

+(void) shareExtensionSave {
    
    NSUserDefaults * groupUserDefaults = [[NSUserDefaults alloc] initWithSuiteName: @"group.com.exoplatform.mob.eXoPlatformiPHone"];
    NSMutableArray * list_accounts = [[NSMutableArray alloc] init];
    
        NSDictionary * account = @{@"username":@"toan", @"password":@"", @"serverURL":@"http://192.168.1.67:8080", @"accountName": @"local"};
        [list_accounts addObject:account];
    
    [groupUserDefaults setObject:list_accounts forKey:@"exo_share_all_usernames"];


}

// insert an icon to the left of the text field
+ (void)configureTextField:(UITextField *)tf withIcon:(NSString *)iconName
{
    
    [tf setBackgroundColor:[UIColor whiteColor]];
    CGColorRef colorRef = UIColorFromRGB(0xCCCCCC).CGColor;
    [tf.layer setBorderColor:colorRef];
    [tf.layer setBorderWidth:1.0];
    [tf.layer setCornerRadius:4];
    //always show the left view
    tf.leftViewMode = UITextFieldViewModeAlways;
    
    //the view for the left of text field
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, EXO_TEXT_FIELD_PADDING_WIDTH, EXO_TEXT_FIELD_PADDING_WIDTH)];
    
    paddingView.backgroundColor = UIColorFromRGB(0xEEEEEE);
    
    UIImage *image = [UIImage imageNamed:iconName];
    CGRect paddingFrame = CGRectMake((EXO_TEXT_FIELD_PADDING_WIDTH - image.size.width)/2, (EXO_TEXT_FIELD_PADDING_WIDTH - image.size.height)/2, image.size.width, image.size.height);
    //center the image in the padding view
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:paddingFrame];
    imageView.image = image;
    
    [paddingView addSubview:imageView];
    tf.leftView = paddingView;
    
}

@end
