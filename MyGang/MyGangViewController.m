//
//  MyGangViewController.m
//  MyGang
//
//  Created by huan on 5/26/13.
//  Copyright (c) 2013 huan. All rights reserved.
//

#import "MyGangViewController.h"
#import "GangDetailViewController.h"

@interface MyGangViewController ()

@end

@implementation MyGangViewController
{
    NSMutableArray *tableData;
    NSArray *ages;
    NSArray *profileImage;
}

@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"mygang" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    
    tableData = [[NSMutableArray alloc] initWithArray:[dict objectForKey:@"name"]];
    ages = [dict objectForKey:@"age"];
    profileImage = [dict objectForKey:@"profile"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"GangCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];

//    cell.profileImageView.image = [UIImage imageNamed:[profileImage objectAtIndex:indexPath.row]];
//    cell.ageLable.text = [ages objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showGangDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        GangDetailViewController *detailController = segue.destinationViewController;
        detailController.gangName = [tableData objectAtIndex:indexPath.row];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableData removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
