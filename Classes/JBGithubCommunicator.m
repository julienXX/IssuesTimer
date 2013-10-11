//
//  JBGithubCommunicator.m
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/7/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import "JBGithubCommunicator.h"
#import "JBGithubCommunicatorDelegate.h"
#import "AFHTTPRequestOperationManager.h"

#define TOKEN @"7d40d08c541a29698cd2bb7006e542330d28e95f"

@implementation JBGithubCommunicator

- (void) getRepos
{
//    UAGithubEngine *engine = [[UAGithubEngine alloc] initWithUsername:USERNAME password:PASSWORD withReachability:YES];
//    
//    [engine repositoriesWithSuccess:^(id response) {
//        [self.delegate receivedReposJSON:response];
//    } failure:^(NSError *error) {
//        [self.delegate fetchingReposFailedWithError:error];
//    }];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"access_token": TOKEN};
    [manager GET:@"https://api.github.com/user/repos" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
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
