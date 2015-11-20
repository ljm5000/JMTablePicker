//
//  JMPickerTableViewCell.h
//  JMTablePicker
//
//  Created by 梁继明 on 15/11/20.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMPickerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemContentLabel;

@end
