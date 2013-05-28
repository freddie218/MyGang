//
//  MyGangViewController.m
//  MyGang
//
//  Created by huan on 5/26/13.
//  Copyright (c) 2013 huan. All rights reserved.
//

#import "MyGangViewController.h"
#import "GangDetailViewController.h"
#import "Fellow.h"

@interface MyGangViewController ()

@end

@implementation MyGangViewController
{
    NSMutableArray *tableData;
    NSArray *ages;
    NSArray *profileImage;
    NSArray *knowledges;
    
    NSMutableArray *fellows;
    NSMutableArray *searchResults;
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
    knowledges = [dict objectForKey:@"knowledge"];
    
    fellows = [NSMutableArray arrayWithCapacity:11];
    
    for (int i=0; i<11; i++) {
        Fellow *fellow = [Fellow new];
        fellow.fellowName = [tableData objectAtIndex:i];
        fellow.fellowAge = [ages objectAtIndex:i];
        fellow.fellowImage = [profileImage objectAtIndex:i];
        fellow.fellowKnowledge = [knowledges objectAtIndex:i];
        
        [fellows addObject:fellow];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    } else {
        return [tableData count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"GangCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [[searchResults objectAtIndex:indexPath.row] fellowName];
    } else {
        cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showGangDetail"]) {
        GangDetailViewController *detailController = segue.destinationViewController;
        NSIndexPath *indexPath = nil;
        
        if ([self.searchDisplayController isActive]) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            detailController.fellow = [searchResults objectAtIndex:indexPath.row];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            detailController.fellow = [fellows objectAtIndex:indexPath.row];
        }
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableData removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"fellowName contains[cd] %@", searchText];
    searchResults = [fellows filteredArrayUsingPredicate:resultPredicate];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                       objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        [self performSegueWithIdentifier:@"showGangDetail" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
