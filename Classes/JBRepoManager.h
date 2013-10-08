//
//  JBRepoManager.h
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/7/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JBRepoManagerDelegate.h"
#import "JBGithubCommunicatorDelegate.h"

@class JBGithubCommunicator;

@interface JBRepoManager : NSObject

@property (strong, nonatomic) JBGithubCommunicator *communicator;
@property (weak, nonatomic) id<JBRepoManagerDelegate> delegate;

- (void)fetchRepos;

@end
