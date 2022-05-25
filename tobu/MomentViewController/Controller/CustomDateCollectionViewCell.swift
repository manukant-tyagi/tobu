//
//  CustomDateCollectionViewCell.swift
//  tobu
//
//  Created by manukant tyagi on 25/05/22.
//

import UIKit
class CustomDateCollectionViewCell: UICollectionViewCell {
    //MARK: - outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - functions
    func UISteup(){
        mainView.layer.cornerRadius = 40
    }

}
