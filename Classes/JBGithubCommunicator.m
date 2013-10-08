//
//  JBGithubCommunicator.m
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/7/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import "JBGithubCommunicator.h"
#import "JBGithubCommunicatorDelegate.h"

#define USERNAME @"foo"
#define PASSWORD @"bar"

@implementation JBGithubCommunicator

- (void) getRepos
{
    UAGithubEngine *engine = [[UAGithubEngine alloc] initWithUsername:USERNAME password:PASSWORD withReachability:YES];
    
    [engine repositoriesWithSuccess:^(id response) {
        NSLog(@"receivedRepos");
        [self.delegate receivedReposJSON:response];
    } failure:^(NSError *error) {
        NSLog(@"Error Fetch Repos");
        [self.delegate fetchingReposFailedWithError:error];
    }];
}

- (void) githubConnectionError:(NSError *)error
{
    UIAlertView* dialog = [[UIAlertView alloc] init];
    [dialog setDelegate:self];
    [dialog setTitle:@"Can't connect"];
    [dialog addButtonWithTitle:@"OK"];
    [dialog show];
    
    NSLog(@"Oops: %@", error);
}

@end
