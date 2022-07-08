//
//  CollectionFriendVC.swift
//  MyVK
//
//  Created by Максим Марков on 05.06.2022.
//

import UIKit

class CollectionFriendVC: UIViewController {
    
    @IBOutlet weak var fotoCollectionView: UICollectionView!
    
    
    let fotoCollectionViewCellReuseIdentifier = "fotoCollectionViewCellReuseIdentifier"
    let fromCollectionFriendToGalleryVC = "fromCollectionFriendToGalleryVC"
    
    var fotoAlbum = [MyFoto]()
    var masImg = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fotoCollectionView.register(UINib(nibName: "FotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: fotoCollectionViewCellReuseIdentifier)
        fotoCollectionView.dataSource = self
        fotoCollectionView.delegate = self
  
        

    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fotoCollectionView.reloadData()
    }
    
    
    
}

