//
//  ViewController.m
//  JMTablePicker
//
//  Created by 梁继明 on 15/11/20.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "ViewController.h"
#import "JMTablePickerViewController.h"
#import "JMPickerTableViewCell.h"

@interface ViewController ()<JMPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)show:(id)sender {
    
    JMTablePickerViewController *pickerVC = [[JMTablePickerViewController alloc] init];
    
    pickerVC.delegate = self;
    
    NSArray *testData = @[@[@"array1",@[@"11",@"12",@"13",@"14"]],@[@"array2",@[@"21",@"22",@"23",@"24"]],@[@"array3",@[@"31",@"32",@"33",@"34"]]];
    
    [pickerVC.dataArray addObjectsFromArray:testData];
    
    [self.view addSubview:pickerVC.view];
    [self addChildViewController:pickerVC];
    
    //[self.navigationController pushViewController:pickerVC animated:YES];
}

#pragma mark - JMPicker delegate

-(void)JMHeaderViewForRow:(UIButton *)btn{

    //btn已经挂载好方法了，自己修改样式把。Title已经放到里面了。


}

-(CGFloat)JMPickerHeightForRowWithIndexPath:(NSIndexPath *)indexPaht WithDataSoucre:(NSArray *)array{

    return 150.0;

}

-(UITableViewCell *)JMPickerCellForRowAtIndexWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexPath WithDataSoucre:(NSArray *)array{

    JMPickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JMPickerTableViewCell" owner:self options:nil] lastObject];
    }
    
    cell.itemTitleLabel.text = [array objectAtIndex:indexPath.row];
    
    [cell.itemImageView setImage:[UIImage imageNamed:@"test"]];
    
    return cell;
    

}

-(void)JMPickerSelectIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}

#pragma mark;

@end
