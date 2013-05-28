//
//  GangDetailViewController.m
//  MyGang
//
//  Created by huan on 5/26/13.
//  Copyright (c) 2013 huan. All rights reserved.
//

#import "GangDetailViewController.h"

@interface GangDetailViewController ()

@end

@implementation GangDetailViewController

@synthesize fellow;

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
    
    self.nameLable.text = fellow.fellowName;
    self.fellowAge.text = fellow.fellowAge;
    self.fellowImage.image = [UIImage imageNamed:fellow.fellowImage];
    
    NSMutableString *knowledgeStr = [NSMutableString string];
    for (NSString *know in fellow.fellowKnowledge) {
        [knowledgeStr appendFormat:@"%@\n", know];
    }
    self.fellowKnowledge.text = knowledgeStr;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
