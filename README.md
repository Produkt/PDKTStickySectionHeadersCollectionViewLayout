## Description

UICollectionViewFlowLayout subclass that makes section headers behave like UITableView section headers.

Section header views stick to the top of the collection view, over it's section cells.


## Sample

![Sample Image](https://raw.github.com/Produkt/PDKTStickySectionHeadersCollectionViewLayout/master/readme/sample.gif)


## Usage

Simply add ```PDKTStickySectionHeadersCollectionViewLayout.h``` and ```PDKTStickySectionHeadersCollectionViewLayout.m``` files to your project and use it as your UICollectionViewLayout

If you are using Interface Builder to configure your Collection View, simply switch “Flow” to “Custom” at the Layout selector. Then set PDKTStickySectionHeadersCollectionViewLayout as your CollectionView Layout Class.

![Interface Builder Config](https://raw.github.com/Produkt/PDKTStickySectionHeadersCollectionViewLayout/master/readme/ibconfig.png)

## Notes
```PDKTStickySectionHeadersCollectionViewLayout``` is a ```UICollectionViewFlowLayout``` subclass, so you also must confrom the  ```UICollectionViewFlowLayoutDelegate``` protocol in order to provide the required information about the cells to be drawn. 

## Compatibility
- ```PDKTStickySectionHeadersCollectionViewLayout``` is compatible with iOS6.0+
- ```PDKTStickySectionHeadersCollectionViewLayout``` requires ARC.

## License
`PDKTStickySectionHeadersCollectionViewLayout ` is available under the MIT license. See the LICENSE file for more info.
