
//
//  TopicsGridCollectionViewCell.swift
//  Podcast
//
//  Created by Mindy Lou on 12/22/17.
//  Copyright © 2017 Cornell App Development. All rights reserved.
//

import UIKit

class TopicsGridCollectionViewCell: UICollectionViewCell {
    var backgroundLabel: UILabel!
    var topicLabel: UILabel!
    let headerOffset: CGFloat = 60
    let topicLabelHeight: CGFloat = 18

    let backgroundColors: [UIColor] = [.rosyPink, .sea, .duskyBlue, .dullYellow]

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundLabel = UILabel(frame: frame)
        addSubview(backgroundLabel)
        backgroundLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(headerOffset)
            make.width.height.equalTo(frame.width)
            make.leading.trailing.equalToSuperview()
        }

        topicLabel = UILabel(frame: .zero)
        topicLabel.textAlignment = .center
        topicLabel.lineBreakMode = .byWordWrapping
        topicLabel.numberOfLines = 0
        topicLabel.textColor = .offWhite
        topicLabel.font = ._12SemiboldFont()
        addSubview(topicLabel)

        topicLabel.snp.makeConstraints { make in
            make.center.equalTo(backgroundLabel.snp.center)
            make.leading.trailing.equalToSuperview()
            make.width.equalTo(backgroundLabel.snp.width)
        }

    }

    func configure(for topic: Topic, at index: Int) {
        topicLabel.text = topic.name
        backgroundLabel.backgroundColor = backgroundColors[index % 4]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
