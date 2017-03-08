//
//  SearchTagTableViewCell.swift
//  Podcast
//
//  Created by Kevin Greer on 3/5/17.
//  Copyright © 2017 Cornell App Development. All rights reserved.
//

import UIKit

class SearchTagTableViewCell: UITableViewCell {
    
    let imageViewPaddingX: CGFloat = 18
    let imageViewPaddingY: CGFloat = 18
    let imageViewWidth: CGFloat = 18
    let imageViewHeight: CGFloat = 18
    let imageViewLabelPadding: CGFloat = 12
    
    var tagImageView: UIImageView!
    var nameLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        tagImageView = UIImageView(image: #imageLiteral(resourceName: "tag"))
        nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 14, weight: UIFontWeightRegular)
        contentView.addSubview(tagImageView)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tagImageView.frame = CGRect(x: imageViewPaddingX, y: imageViewPaddingY, width: imageViewWidth, height: imageViewHeight)
        let nameLabelX: CGFloat = tagImageView.frame.maxX + imageViewLabelPadding
        nameLabel.frame = CGRect(x: nameLabelX, y: imageViewPaddingY, width: frame.width - nameLabelX, height: imageViewHeight)
        separatorInset = UIEdgeInsets(top: 0, left: nameLabelX, bottom: 0, right: 0)

    }
}