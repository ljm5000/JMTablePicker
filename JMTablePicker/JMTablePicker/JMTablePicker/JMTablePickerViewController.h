//
//  JMTablePickerViewController.h
//  JMTablePicker
//
//  Created by 梁继明 on 15/11/20.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JMPickerDelegate

-(void)JMHeaderViewForRow:(UIButton *)btn;


-(CGFloat)JMPickerHeightForRowWithIndexPath:(NSIndexPath*)indexPaht WithDataSoucre:(NSArray *)array;

-(UITableViewCell *)JMPickerCellForRowAtIndexWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexPath WithDataSoucre:(NSArray *)array;

-(void)JMPickerSelectIndexPath:(NSIndexPath *)indexPath;

@end


@interface JMTablePickerViewController : UIViewController


/**
 *  数据源 @[@"title",@[item1,item2]];
 */
@property (nonatomic,strong) NSMutableArray *dataArray;

@property (weak, nonatomic) IBOutlet UILabel *pickeryTitleLabel;

@property (weak, nonatomic) IBOutlet UITableView *pickerTableView;

@property (weak, nonatomic) IBOutlet UIButton *firstBtn;

@property (weak, nonatomic) IBOutlet UIButton *secondBtn;

@property (weak, nonatomic) IBOutlet UIView *bgView;

@property(nonatomic,assign) id< JMPickerDelegate> delegate;

@property (nonatomic) CGFloat sectionHeight;

-(void)show;

-(void)dismiss;


@end
