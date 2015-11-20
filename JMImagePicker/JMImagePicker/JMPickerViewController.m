//
//  JMPickerViewController.m
//  JMImagePicker
//
//  Created by 梁继明 on 15/11/12.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "JMPickerViewController.h"
#import "DNImagePickerController.h"

@interface JMPickerViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, DNImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end

@implementation JMPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.myCollectionView.delegate = self;
    
    self.myCollectionView.dataSource = self;

    [self.myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 11;

}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"hello world");

    DNImagePickerController *imagePicker = [[DNImagePickerController alloc] init];
    imagePicker.imagePickerDelegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}


#pragma mark -

#pragma mark - DNImagePickerControllerDelegate

- (void)dnImagePickerController:(DNImagePickerController *)imagePickerController sendImages:(NSArray *)imageAssets isFullImage:(BOOL)fullImage
{
    //self.assetsArray = [NSMutableArray arrayWithArray:imageAssets];
    
    /*
    CollectionViewController *collectionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CollectionViewController"];
    collectionVC.isFullImage = fullImage;
    collectionVC.imageArray = imageAssets;
    [self.navigationController pushViewController:collectionVC animated:YES];*/
    
}

- (void)dnImagePickerControllerDidCancel:(DNImagePickerController *)imagePicker
{
   
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
