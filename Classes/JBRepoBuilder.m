//
//  JBRepoBuilder.m
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/7/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import "JBRepoBuilder.h"
#import "JBRepo.h"

@implementation JBRepoBuilder

+ (NSArray *)reposFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;

    if (localError != nil) {
        *error = localError;
        return nil;
    }

    NSMutableArray *repos = [[NSMutableArray alloc] init];

    NSArray *results = [NSArray arrayWithArray:objectNotation];
    
    for (NSDictionary *repoDic in results) {
        JBRepo *repo = [[JBRepo alloc] init];
        
        [repo setValue:[repoDic valueForKey:@"full_name"] forKey:@"full_name"];
        [repo setValue:[repoDic valueForKey:@"open_issues"] forKey:@"issues_count"];

        [repos addObject:repo];
    }
    
    return repos;
}

@end
