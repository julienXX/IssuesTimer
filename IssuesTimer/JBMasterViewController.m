//
//  JBMasterViewController.m
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/7/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import "JBMasterViewController.h"
#import "JBIssuesViewController.h"
#import "JBDetailCell.h"
#import "JBRepo.h"
#import "JBRepoManager.h"
#import "JBGithubCommunicator.h"

@interface JBMasterViewController () <JBRepoManagerDelegate> {
    NSArray *_repos;
    JBRepoManager *_manager;
}
@end

@implementation JBMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _manager = [[JBRepoManager alloc] init];
    _manager.communicator = [[JBGithubCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    [self startFetchingRepos];

}

- (void)startFetchingRepos
{
    NSLog(@"Start Fetching Repos");
    [_manager fetchRepos];
}

- (void)didReceiveRepos:(NSArray *)repos
{
    _repos = repos;
    [self.tableView reloadData];
}

- (void)fetchingReposFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _repos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JBDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JBDetailCell" forIndexPath:indexPath];
    
    JBRepo *repo = _repos[indexPath.row];
    [cell.nameLabel setText:repo.full_name];
    [cell.countLabel setText:[NSString stringWithFormat:@"%@", repo.issues_count]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        JBRepo *repo = _repos[indexPath.row];
        [[segue destinationViewController] setDetailItem:repo];
    }
}

@end
