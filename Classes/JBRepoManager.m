//
//  JBRepoManager.m
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/7/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import "JBRepoManager.h"
#import "JBRepoBuilder.h"
#import "JBGithubCommunicator.h"

@implementation JBRepoManager

- (void)fetchRepos
{
    [self.communicator getRepos];
}

#pragma mark - JBGithubCommunicatorDelegate

- (void)receivedReposJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *repos = [JBRepoBuilder reposFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingReposFailedWithError:error];
    } else {
        [self.delegate didReceiveRepos:repos];
    }
}

- (void)fetchingReposFailedWithError:(NSError *)error
{
    [self.delegate fetchingReposFailedWithError:error];
}

@end
