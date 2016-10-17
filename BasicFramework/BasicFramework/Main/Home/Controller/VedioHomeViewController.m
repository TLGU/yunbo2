//
//  VedioHomeViewController.m
//  BasicFramework
//
//  Created by mr_right on 16/10/17.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "VedioHomeViewController.h"
#import "HomeCollectionViewCell.h"
#import "HomeCollectionViewHeader.h"
#define itemWidth (kScreenWidth-4)/2.0f
#define itemHeight (kScreenHeight-49)/4.0f
#define collectionViewHeaderHeight itemHeight*2.0f-40
@interface VedioHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(strong,nonatomic)UICollectionView *collectionView;
@end

@implementation VedioHomeViewController

static NSString *HomeCollectionViewCellID=@"HomeCollectionViewCellID";

static NSString *HomeCollectionViewHeaderID=@"HomeCollectionViewHeaderID";

-(UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout  *layout=[[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection=UICollectionViewScrollDirectionVertical;
        layout.itemSize=CGSizeMake(itemWidth, itemHeight);
        layout.sectionInset=UIEdgeInsetsMake(0, 1, 0, 1);
        layout.minimumLineSpacing=1;
        layout.minimumInteritemSpacing=2;
        layout.headerReferenceSize=CGSizeMake(kScreenWidth, collectionViewHeaderHeight);
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.view.Sh) collectionViewLayout:layout];
        [_collectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:HomeCollectionViewCellID];
        _collectionView.backgroundColor=self.view.backgroundColor;
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        _collectionView.contentInset=UIEdgeInsetsMake(0, 0, 49, 0);
        _collectionView.scrollIndicatorInsets=_collectionView.contentInset;
        [_collectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HomeCollectionViewHeaderID];
        
    }
    return _collectionView;
}

#pragma mark--
#pragma mark--lify cycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:self.collectionView];
    
}

#pragma mark--
#pragma mark--UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:HomeCollectionViewCellID forIndexPath:indexPath];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
       HomeCollectionViewHeader *header= [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HomeCollectionViewHeaderID forIndexPath:indexPath];
        return header;
    }
    return nil;
}


@end
