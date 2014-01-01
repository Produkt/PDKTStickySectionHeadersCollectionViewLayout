//
//  UICollectionViewTableViewLikeFlowLayout.m
//  Caoba
//
//  Created by Daniel García on 26/12/13.
//  Copyright (c) 2013 Produkt. All rights reserved.
//

#import "PDKTStickySectionHeadersCollectionViewLayout.h"

@implementation PDKTStickySectionHeadersCollectionViewLayout

- (BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (NSArray *) layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    NSMutableArray *visibleSectionsWithoutHeader = [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *itemAttributes in attributes) {
        if (![visibleSectionsWithoutHeader containsObject:[NSNumber numberWithInteger:itemAttributes.indexPath.section]]) {
            [visibleSectionsWithoutHeader addObject:[NSNumber numberWithInteger:itemAttributes.indexPath.section]];
        }
        if (itemAttributes.representedElementKind==UICollectionElementKindSectionHeader) {
            NSUInteger indexOfSectionObject=[visibleSectionsWithoutHeader indexOfObject:[NSNumber numberWithInteger:itemAttributes.indexPath.section]];
            if (indexOfSectionObject!=NSNotFound) {
                [visibleSectionsWithoutHeader removeObjectAtIndex:indexOfSectionObject];
            }
        }
    }
    for (NSNumber *sectionNumber in visibleSectionsWithoutHeader) {
        UICollectionViewLayoutAttributes *headerAttributes=[self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:[sectionNumber integerValue]]];
        if (headerAttributes.frame.size.width>0 && headerAttributes.frame.size.height>0) {
            [attributes addObject:headerAttributes];
        }
    }
    for (UICollectionViewLayoutAttributes *itemAttributes in attributes) {
        if (itemAttributes.representedElementKind==UICollectionElementKindSectionHeader) {
            UICollectionViewLayoutAttributes *headerAttributes = itemAttributes;
            UICollectionViewLayoutAttributes *lastItemAttributes=nil;
            for (UICollectionViewLayoutAttributes *itemAttributesY in attributes) {
                if (itemAttributesY.indexPath.section==headerAttributes.indexPath.section && (!lastItemAttributes || lastItemAttributes.indexPath.item<itemAttributesY.indexPath.item) ) {
                    lastItemAttributes=itemAttributesY;
                }
            }
            CGPoint contentOffset = self.collectionView.contentOffset;
            CGPoint originInCollectionView=CGPointMake(headerAttributes.frame.origin.x-contentOffset.x, headerAttributes.frame.origin.y-contentOffset.y);
            originInCollectionView.y-=self.collectionView.contentInset.top;
            CGRect frame = headerAttributes.frame;
            if (originInCollectionView.y<0) {
                frame.origin.y+=(originInCollectionView.y*-1);
            }
            if (CGRectGetMaxY(frame)>=CGRectGetMaxY(lastItemAttributes.frame)) {
                frame.origin.y=CGRectGetMaxY(lastItemAttributes.frame)-frame.size.height;
            }
            headerAttributes.frame = frame;
            headerAttributes.zIndex = 1024;
        }
    }
    return attributes;
}
@end
