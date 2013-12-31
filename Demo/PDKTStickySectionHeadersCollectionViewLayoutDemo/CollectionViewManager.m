//
//  CollectionViewManager.m
//  PDKTStickySectionHeadersCollectionViewLayoutDemo
//
//  Created by Daniel García on 31/12/13.
//  Copyright (c) 2013 Produkt. All rights reserved.
//

#import "CollectionViewManager.h"
#import "CollectionViewCell.h"

static NSUInteger const kNumberOfSections = 5;
static NSUInteger const kNumberItemsPerSection = 10;
@interface CollectionViewManager()
@property (strong,nonatomic) UINib *cellNib;
@end
@implementation CollectionViewManager

- (void)setCollectionView:(UICollectionView *)collectionView{
    _collectionView=collectionView;
    if (_collectionView) {
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        [self registerCellsForCollectionView:_collectionView];
        [_collectionView reloadData];
    }
}

#pragma mark - Cells
- (UINib *)cellNib{
    if (!_cellNib) {
        _cellNib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];;
    }
    return _cellNib;
}
- (void)registerCellsForCollectionView:(UICollectionView *)collectionView{
    [collectionView registerNib:self.cellNib forCellWithReuseIdentifier:@"CollectionViewCell"];
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
#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section%2==0) {
        return CGSizeMake(self.collectionView.bounds.size.width/2, 150);
    }
    return CGSizeMake(self.collectionView.bounds.size.width, 150);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1.0;
}
@end
