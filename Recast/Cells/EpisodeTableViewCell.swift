//
//  EpisodeTableViewCell.swift
//  
//
//  Created by Jack Thompson on 9/15/18.
//

import UIKit
import SnapKit

class EpisodeTableViewCell: UITableViewCell {

    // MARK: - Variables
    var episodeImageView: UIImageView!
    var episodeNameLabel: UILabel!
    var episodeDescriptionView: UILabel!
    var dateTimeLabel: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .white

        episodeImageView = UIImageView()

        episodeNameLabel = UILabel()
        episodeNameLabel.font = .systemFont(ofSize: 16)

        dateTimeLabel = UILabel()
        dateTimeLabel.font = .systemFont(ofSize: 12)

        episodeDescriptionView = UILabel()
        episodeDescriptionView.font = .systemFont(ofSize: 14)
        episodeDescriptionView.textAlignment = .left
        episodeDescriptionView.numberOfLines = 3

        addSubview(episodeImageView)
        addSubview(episodeNameLabel)
        addSubview(episodeDescriptionView)
        addSubview(dateTimeLabel)

        // MARK: - Test data:
        episodeImageView.backgroundColor = .blue
        episodeNameLabel.text = "Episode Title"
        dateTimeLabel.text = "Jan. 1, 2018 • 23:00"
        // swiftlint:disable:next line_length
        episodeDescriptionView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

        setUpConstraints()
    }

    func setUpConstraints() {
        // MARK: - Constants
        let padding = 5
        let imageHeight = 50

        episodeImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(padding)
            make.height.width.equalTo(imageHeight)
        }

        episodeNameLabel.snp.makeConstraints { make in
            make.top.equalTo(episodeImageView)
            make.leading.equalTo(episodeImageView.snp.right).offset(padding)
            make.trailing.equalToSuperview().inset(padding)
        }

        dateTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(episodeNameLabel.snp.bottom)
            make.leading.trailing.equalTo(episodeNameLabel)
        }

        episodeDescriptionView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(padding)
            make.trailing.bottom.equalToSuperview().inset(padding)
            make.top.equalTo(episodeImageView.snp.bottom).offset(padding)
        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
