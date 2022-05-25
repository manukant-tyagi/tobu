//
//  MomentViewController.swift
//  tobu
//
//  Created by manukant tyagi on 25/05/22.
//

import UIKit

class MomentViewController: UIViewController {
    //MARK: - Variables and properties
    private let calender = Calendar(identifier: .gregorian)
    let image = [UIImage(named: "thor"), UIImage(named: "strange"), UIImage(named: "testPhoto")]
    //MARK: - IBOutlets
    @IBOutlet weak var momentCollectionView: UICollectionView!
//MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewRequiredStuffs()
    }
    
    //MARK: - functions
    func collectionViewRequiredStuffs(){
        momentCollectionView.delegate = self
        momentCollectionView.dataSource = self
        momentCollectionView.register(UINib(nibName: "AddMomentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AddMomentCollectionViewCell")
        momentCollectionView.register(UINib(nibName: "MomentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MomentCollectionViewCell")
    }
}

//MARK: - collection delegates and datasources
extension MomentViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0{
            let cell = momentCollectionView.dequeueReusableCell(withReuseIdentifier: "AddMomentCollectionViewCell", for: indexPath) as! AddMomentCollectionViewCell
            return cell
        }else{
            let cell = momentCollectionView.dequeueReusableCell(withReuseIdentifier: "MomentCollectionViewCell", for: indexPath) as! MomentCollectionViewCell
            cell.momentImageView.image = image[indexPath.row - 1]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height = momentCollectionView.bounds.size.height * 0.7
        let width = momentCollectionView.bounds.size.width * 0.45
        if indexPath.row != 0{
            return CGSize(width: width, height: height)
        }else{
            height = momentCollectionView.bounds.size.height * 0.3
            return CGSize(width: width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: momentCollectionView.bounds.size.width * 0.03, left: momentCollectionView.bounds.size.width * 0.03, bottom: momentCollectionView.bounds.size.width * 0.03, right: momentCollectionView.bounds.size.width * 0.03)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        momentCollectionView.bounds.size.width * 0.03
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        momentCollectionView.bounds.size.width * 0.03
    }
    
    
}
