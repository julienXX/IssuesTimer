//
//  JBGithubCommunicator.h
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/7/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JBGithubCommunicatorDelegate;

@interface JBGithubCommunicator : NSObject

@property (weak, nonatomic) id<JBGithubCommunicatorDelegate> delegate;

- (void)getRepos;
- (void)githubConnectionError:error;

@end

