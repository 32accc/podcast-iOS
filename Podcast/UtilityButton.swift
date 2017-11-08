//
//  UtilityButton.swift
//  Podcast
//
//  Created by Mindy Lou on 11/8/17.
//  Copyright © 2017 Cornell App Development. All rights reserved.
//

import UIKit

class UtilityButton: UIButton {
    // Minimum touch targets for interactive elements per Apple human interface guidelines
    let tapWidth: CGFloat = 44
    let tapHeight: CGFloat = 44

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let area = bounds.insetBy(dx: bounds.width < tapWidth ? bounds.width - tapWidth : 0, dy: bounds.height < tapHeight ? bounds.height - tapHeight : 0)
        return area.contains(point)
    }

}