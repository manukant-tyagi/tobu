//
//  ViewController.swift
//  tobu
//
//  Created by manukant tyagi on 24/05/22.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - variables and properties
    let image = [UIImage(named: "thor"), UIImage(named: "strange")]
    
    //MARK: - Outlets
    @IBOutlet weak var momentViewAllButton: UIButton!
    @IBOutlet weak var contactViewAllButton: UIButton!
    @IBOutlet weak var momentsCollectionView: UICollectionView!
    @IBOutlet weak var contactCollectionView: UICollectionView!
    @IBOutlet weak var cameraButton: UIButton!
    
    //MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewRequiredStuff()
        momentViewAllButton.semanticContentAttribute = .forceRightToLeft
        contactViewAllButton.semanticContentAttribute = .forceRightToLeft
    }
    
    //MARK: - functions
    func collectionViewRequiredStuff(){
        contactCollectionView.delegate = self
        contactCollectionView.dataSource = self
        momentsCollectionView.delegate = self
        momentsCollectionView.dataSource = self
        momentsCollectionView.register(UINib(nibName: "RecentMomentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RecentMomentCollectionViewCell")
        contactCollectionView.register(UINib(nibName: "ContactCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ContactCollectionViewCell")
    }
}

//MARK: - collection delegates and datasources
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == momentsCollectionView ? image.count : 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == momentsCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentMomentCollectionViewCell", for: indexPath) as! RecentMomentCollectionViewCell
            cell.momentImageView.image
            = image[indexPath.row]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCollectionViewCell", for: indexPath) as! ContactCollectionViewCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = collectionView.bounds.size.width * 0.6
        let height = collectionView.bounds.size.height
        if collectionView == contactCollectionView {
            width = collectionView.bounds.size.width * 0.7
        }
        return CGSize(width: width , height: height)
    }
    
    
}

