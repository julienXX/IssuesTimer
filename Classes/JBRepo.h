//
//  JBRepo.h
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/7/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBRepo : NSObject

@property (strong, nonatomic) NSString *full_name;
@property (strong, nonatomic) NSString *issues_count;

@end