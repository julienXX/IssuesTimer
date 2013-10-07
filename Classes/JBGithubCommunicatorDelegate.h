//
//  JBRepoManagerDelegate.h
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/7/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JBGithubCommunicatorDelegate <NSObject>

- (void)receivedReposJSON:(NSData *)objectNotation;
- (void)fetchingReposFailedWithError:(NSError *)error;

@end