//
//  RecommendedSeriesCollectionViewFlowLayout.swift
//  Podcast
//
//  Created by Kevin Greer on 2/19/17.
//  Copyright © 2017 Cornell App Development. All rights reserved.
//

import UIKit

class RecommendedSeriesCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var cellWidth: CGFloat!
    var cellHeight: CGFloat!

    let leadingPadding: CGFloat = 18
    
    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: 100, height: (collectionView?.frame.height)!)
        minimumInteritemSpacing = 6
        sectionInset = .init(top: 0, left: -1 * UIScreen.main.bounds.width + leadingPadding, bottom: 0, right: 0)
        scrollDirection = .horizontal
        sectionHeadersPinToVisibleBounds = true
    }
}
