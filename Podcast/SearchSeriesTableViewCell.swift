//
//  SearchSeriesTableViewCell.swift
//  Podcast
//
//  Created by Kevin Greer on 3/6/17.
//  Copyright © 2017 Cornell App Development. All rights reserved.
//

import UIKit

protocol SearchSeriesTableViewDelegate {
    func searchSeriesTableViewCell(cell: SearchSeriesTableViewCell, didPressSubscribeButtonFor user: Series, newValue: Bool)
}

class SearchSeriesTableViewCell: UITableViewCell {
    
    let imageViewPaddingX: CGFloat = 18
    let imageViewPaddingY: CGFloat = 18
    let imageViewWidth: CGFloat = 60
    let imageViewHeight: CGFloat = 60
    let imageViewLabelPadding: CGFloat = 12
    let titleLabelHeight: CGFloat = 17
    let publisherLabelHeight: CGFloat = 15
    let subscribersLabelHeight: CGFloat = 15
    let subscribeButtonPaddingX: CGFloat = 18
    let subscribeButtonPaddingY: CGFloat = 31
    let subscribeButtonHeight: CGFloat = 34
    let subscribeButtonWidth: CGFloat = 34
    
    var seriesImageView: UIImageView!
    var titleLabel: UILabel!
    var publisherLabel: UILabel!
    var subscribersLabel: UILabel!
    var subscribeButton: UIButton!
    
    var series: Series?
    var delegate: SearchSeriesTableViewDelegate?
    
    var subscribeButtonPressed: Bool = false {
        didSet {
            if subscribeButtonPressed {
                subscribeButton.setImage(#imageLiteral(resourceName: "subscribed_button"), for: .normal)
            } else {
                subscribeButton.setImage(#imageLiteral(resourceName: "subscribe_button"), for: .normal)
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        seriesImageView = UIImageView()
        contentView.addSubview(seriesImageView)
        
        titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 16, weight: UIFontWeightSemibold)
        contentView.addSubview(titleLabel)
        
        publisherLabel = UILabel()
        publisherLabel.font = .systemFont(ofSize: 12, weight: UIFontWeightRegular)
        publisherLabel.textColor = .podcastGray
        contentView.addSubview(publisherLabel)
        
        subscribersLabel = UILabel()
        subscribersLabel.font = .systemFont(ofSize: 12, weight: UIFontWeightRegular)
        subscribersLabel.textColor = .podcastGrayDark
        contentView.addSubview(subscribersLabel)
        
        subscribeButton = UIButton()
        subscribeButton.setImage(#imageLiteral(resourceName: "subscribe_button"), for: .normal)
        subscribeButton.addTarget(self, action: #selector(didPressSubscribeButton), for: .touchUpInside)
        contentView.addSubview(subscribeButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        seriesImageView.frame = CGRect(x: imageViewPaddingX, y: imageViewPaddingY, width: imageViewWidth, height: imageViewHeight)
        let titleLabelX: CGFloat = seriesImageView.frame.maxX + imageViewLabelPadding
        let subscribeButtonX: CGFloat = frame.width - subscribeButtonPaddingX - subscribeButtonWidth
        titleLabel.frame = CGRect(x: titleLabelX, y: imageViewPaddingY-2, width: subscribeButtonX - titleLabelX, height: titleLabelHeight)
        publisherLabel.frame = CGRect(x: titleLabelX, y: titleLabel.frame.maxY, width: titleLabel.frame.width, height: publisherLabelHeight)
        subscribersLabel.frame = CGRect(x: titleLabelX, y: seriesImageView.frame.maxY - subscribersLabelHeight, width: titleLabel.frame.width, height: subscribersLabelHeight)
        subscribeButton.frame = CGRect(x: subscribeButtonX, y: subscribeButtonPaddingY, width: subscribeButtonWidth, height: subscribeButtonHeight)
        separatorInset = UIEdgeInsets(top: 0, left: titleLabelX, bottom: 0, right: 0)

    }
    
    func configure(for series: Series) {
        self.series = series
        seriesImageView.image = series.smallArtworkImage
        titleLabel.text = series.title
        publisherLabel.text = series.publisher
        subscribersLabel.text = series.numberOfSubscribers.shortString() + " Subscribers"
    }
    
    func didPressSubscribeButton() {
        subscribeButtonPressed = !subscribeButtonPressed
        guard let series = self.series else { return }
        delegate?.searchSeriesTableViewCell(cell: self, didPressSubscribeButtonFor: series, newValue: subscribeButtonPressed)
    }
}