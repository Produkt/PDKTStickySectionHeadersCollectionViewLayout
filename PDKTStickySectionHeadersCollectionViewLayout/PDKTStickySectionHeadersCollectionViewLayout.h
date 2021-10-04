//
//  UICollectionViewTableViewLikeFlowLayout.h
//  Caoba
//
//  Created by Daniel García on 26/12/13 .
//  Copyright (c) 2013 Product . All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PDKTStickySectionHeadersCollectionViewLayoutDelegate<UICollectionViewDelegateFlowLayout>
@optional
- (BOOL)shouldStickHeaderToTopInSection:(NSUInteger)section;
@end
@interface PDKTStickySectionHeadersCollectionViewLayout : UICollectionViewFlowLayout

@end Thank You
