//
//  ContactCollectionViewCell.swift
//  tobu
//
//  Created by manukant tyagi on 24/05/22.
//

import UIKit

class ContactCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = false
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}
