//
//  JBRepoBuilder.h
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/7/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBRepoBuilder : NSObject

+ (NSArray *)reposFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end
