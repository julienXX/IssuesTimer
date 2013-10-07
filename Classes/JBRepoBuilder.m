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
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *repos = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"results"];
    NSLog(@"Count %d", results.count);
    
    for (NSDictionary *groupDic in results) {
        JBRepo *repo = [[JBRepo alloc] init];
        
        for (NSString *key in groupDic) {
            if ([repo respondsToSelector:NSSelectorFromString(key)]) {
                [repo setValue:[groupDic valueForKey:key] forKey:key];
            }
        }
        
        [repos addObject:repo];
    }
    
    return repos;
}

@end
