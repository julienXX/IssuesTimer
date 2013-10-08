//
//  JBRepoManagerDelegate.h
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/7/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JBRepoManagerDelegate <NSObject>
- (void)didReceiveRepos:(NSArray *)repos;
- (void)fetchingReposFailedWithError:(NSError *)error;
@end
