//
//  JBDetailCell.h
//  IssuesTimer
//
//  Created by Julien Blanchard on 10/7/13.
//  Copyright (c) 2013 Julien Blanchard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JBDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end
