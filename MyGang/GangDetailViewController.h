//
//  GangDetailViewController.h
//  MyGang
//
//  Created by huan on 5/26/13.
//  Copyright (c) 2013 huan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fellow.h"

@interface GangDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *nameLable;
@property (strong, nonatomic) IBOutlet UILabel *fellowAge;
@property (strong, nonatomic) IBOutlet UIImageView *fellowImage;
@property (strong, nonatomic) IBOutlet UITextView *fellowKnowledge;

@property (strong, nonatomic) Fellow *fellow;

@end
