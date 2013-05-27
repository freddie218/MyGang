//
//  MyGangViewController.h
//  MyGang
//
//  Created by huan on 5/26/13.
//  Copyright (c) 2013 huan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyGangViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
