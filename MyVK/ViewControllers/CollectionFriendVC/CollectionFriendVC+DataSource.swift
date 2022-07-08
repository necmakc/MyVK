//
//  CollectionFriendVC+DataSource.swift
//  MyVK
//
//  Created by Максим Марков on 05.06.2022.
//

import UIKit

extension CollectionFriendVC: UICollectionViewDataSource{
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.fotoAlbum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fotoCollectionViewCellReuseIdentifier, for: indexPath) as!FotoCollectionViewCell
       
        let image = UIImage(named: fotoAlbum[indexPath.item].url)
        //masImg.append(fotoAlbum[indexPath.item].url)
        masImg.append(UIImage(named: fotoAlbum[indexPath.item].url)!)
        cell.configure(image: image, isLiked: false, likeCounter: 5)
        return cell
    }
   
    
    
}
