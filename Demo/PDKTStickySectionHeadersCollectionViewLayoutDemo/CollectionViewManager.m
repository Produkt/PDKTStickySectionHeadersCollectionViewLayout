//
//  CollectionViewManager.m
//  PDKTStickySectionHeadersCollectionViewLayoutDemo
//
//  Created by Daniel García on 31/12/13.
//  Copyright (c) 2013 Produkt. All rights reserved.
//

#import "CollectionViewManager.h"
#import "CollectionViewCell.h"
#import "CollectionViewSectionHeader.h"

static NSUInteger const kNumberOfSections = 5;
static NSUInteger const kNumberItemsPerSection = 10;
@interface CollectionViewManager()
@property (strong,nonatomic) UINib *cellNib;
@property (strong,nonatomic) UINib *sectionHeaderNib;
@end
@implementation CollectionViewManager

- (void)setCollectionView:(UICollectionView *)collectionView{
    _collectionView=collectionView;
    if (_collectionView) {
        [self initCollectionView:collectionView];
    }
}
- (void)initCollectionView:(UICollectionView *)collectionView{
    collectionView.dataSource=self;
    collectionView.delegate=self;
    [self registerCellsForCollectionView:collectionView];
    [self registerSectionHeaderForCollectionView:collectionView];
    [collectionView reloadData];
}
#pragma mark - Cells
- (UINib *)cellNib{
    if (!_cellNib) {
        _cellNib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];;
    }
    return _cellNib;
}
- (UINib *)sectionHeaderNib{
    if (!_sectionHeaderNib) {
        _sectionHeaderNib = [UINib nibWithNibName:@"CollectionViewSectionHeader" bundle:nil];
    }
    return _sectionHeaderNib;
}
- (void)registerCellsForCollectionView:(UICollectionView *)collectionView{
    [collectionView registerNib:self.cellNib forCellWithReuseIdentifier:@"CollectionViewCell"];
}
- (void)registerSectionHeaderForCollectionView:(UICollectionView *)collectionView{
    [collectionView registerNib:self.sectionHeaderNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewSectionHeader"];
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return kNumberOfSections;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return kNumberItemsPerSection;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell;
    static NSString *cellIdentifier=@"CollectionViewCell";
    cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"Cell %d",indexPath.item];
    if (indexPath.section%2==0) {
        cell.backgroundColor=[UIColor redColor];
    }else{
        cell.backgroundColor=[UIColor blueColor];
    }
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    CollectionViewSectionHeader *sectionHeaderView;
    static NSString *viewIdentifier=@"CollectionViewSectionHeader";
    sectionHeaderView=[self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:viewIdentifier forIndexPath:indexPath];
    sectionHeaderView.titleLabel.text=[NSString stringWithFormat:@"Section %d",indexPath.section];
    sectionHeaderView.titleLabel.textColor=[UIColor whiteColor];
    sectionHeaderView.backgroundColor=[UIColor blackColor];
    return sectionHeaderView;
}
#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section%2==0) {
        return CGSizeMake((self.collectionView.bounds.size.width/2)-1, 150);
    }
    return CGSizeMake(self.collectionView.bounds.size.width, 150);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1.0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1.0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.collectionView.bounds.size.width, 60);
}
@end
