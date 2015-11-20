//
//  JMTablePickerViewController.m
//  JMTablePicker
//
//  Created by 梁继明 on 15/11/20.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "JMTablePickerViewController.h"
#import "JMPickerModel.h"
#import "JMPickerTableViewCell.h"

@interface JMTablePickerViewController ()<UITableViewDataSource,UITableViewDelegate>{

    NSInteger selectSection;

    NSArray *selectArray;

}



@end

@implementation JMTablePickerViewController

-(instancetype)init{

    self = [super init];
    
    if (self) {
        
        CGRect rect = [UIScreen mainScreen].bounds;
        
        self.view.frame = rect;
        
           }
    
    return self;


}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    
    

    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
 
    [self initData];


    
}

-(void)initData{

    
    
    if (self.sectionHeight < 10) {
        
        self.sectionHeight = 70;
    }
    
    
    
    selectSection = -1;
    
    self.pickerTableView.delegate = self;
    
    self.pickerTableView.dataSource = self;
    
    self.pickerTableView.tableFooterView = [UIView new];

    [self.firstBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    [self.secondBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];


}





#pragma mark -


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArray.count;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

 
    if (selectSection == section) {
        
        if (selectArray == nil) {
            return 0;
        }
        
         return selectArray.count;
    }
    return 0;
   

}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return self.sectionHeight;


}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320,self.sectionHeight)];
 
    
   // [button setBackgroundColor:[UIColor redColor]];
    
    [button setBackgroundColor:[UIColor lightGrayColor]];
    
    [button setTitle:[[self.dataArray objectAtIndex:section] objectAtIndex:0] forState:UIControlStateNormal];
    
    button.tag = 100 +section;
    
    [button addTarget:self action:@selector(selectIndex:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.delegate JMHeaderViewForRow:button];
    
    return button;

}

-(void)selectIndex:(UIButton *)sender{
    
    NSInteger section = sender.tag - 100;
    
    if (selectSection > -1) {
        
        selectArray = nil;
        
        [self.pickerTableView reloadSections:[NSIndexSet indexSetWithIndex:selectSection] withRowAnimation:UITableViewRowAnimationFade];

    }
    
   
    
    if (selectSection == section) {
        return;
    }
 
    selectSection = section;
    
    selectArray = [self.dataArray[section] objectAtIndex:1];
    
    [self.pickerTableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
    
    [self.pickerTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section] atScrollPosition:UITableViewScrollPositionTop animated:YES];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [self.delegate JMPickerHeightForRowWithIndexPath:indexPath WithDataSoucre:selectArray];


}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

 

    return [self.delegate JMPickerCellForRowAtIndexWithTableView:tableView andIndexPath:indexPath WithDataSoucre:selectArray];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.delegate JMPickerSelectIndexPath:indexPath];
    
    [self dismiss];


}

#pragma mark - 

- (IBAction)dismissAction:(id)sender {
    
    [self dismiss];
}

-(void)dismiss{
  
        
        [UIView animateWithDuration:0.3 animations:^{
            self.view.alpha = 0.0;
           // self.view.transform = CGAffineTransformMakeScale(1.5, 1.5);
            //self.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
        } completion:^(BOOL finished) {
            self.view.transform = CGAffineTransformIdentity;
            self.view.transform = CGAffineTransformIdentity;
            
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
            
        }];
    
}

-(void)show{
    
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        self.view.frame = window.bounds;
        [window addSubview:self.view];
        [self.view layoutIfNeeded];
        self.view.alpha = 0.;
        
        self.view.transform = CGAffineTransformMakeScale(1.5, 1.5);
        [UIView animateWithDuration:0.2 animations:^{
            self.view.alpha = 1.0;
            self.view.transform = CGAffineTransformIdentity;
            [self.view layoutIfNeeded];
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            
        }];
  
/*}else{
        
        [UIView animateWithDuration:0.2 animations:^{
            [self.view layoutIfNeeded];
        }];
        
    }*/
    
}



#pragma mark -lazy load

-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        
        _dataArray = [NSMutableArray array];
    }

    return _dataArray;
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
