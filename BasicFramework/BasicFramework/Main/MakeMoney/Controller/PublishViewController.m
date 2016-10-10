//
//  PublishViewController.m
//  BasicFramework
//
//  Created by mr_right on 16/9/29.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "PublishViewController.h"

@interface PublishViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UITextView *alertIntroTextView;
@end
static NSString *reuseIdentifierPublish=@"reuseIdentifierPublish";
@implementation PublishViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupNav];
    [self setupCollectionView];
    
    self.alertIntroTextView.scrollEnabled=NO;
    self.alertIntroTextView.showsVerticalScrollIndicator=NO;
    [self.alertIntroTextView setPagingEnabled:NO];
    self.alertIntroTextView.userInteractionEnabled=NO;
    
}



-(void)setupNav
{
    self.title=@"发布";
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(downAction:)];
    [self.navigationItem setRightBarButtonItem:rightItem];
    
}

-(void)setupCollectionView
{
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifierPublish];
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.itemSize=CGSizeMake(100, 80);
    layout.sectionInset=UIEdgeInsetsMake(0, 10, 0, 10);
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing=1.0f;
    layout.minimumInteritemSpacing=1.0f;
    [self.collectionView setCollectionViewLayout:layout];
    self.view.backgroundColor=kRGB(219, 219, 219);
}

-(void)downAction:(id)sender{
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell   *cell=[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierPublish forIndexPath:indexPath];
    cell.backgroundColor=[UIColor redColor];
    return cell;
}

@end
