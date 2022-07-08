//
//  CollectionFriendVC+Delegate.swift
//  MyVK
//
//  Created by Максим Марков on 05.06.2022.
//

import UIKit

extension CollectionFriendVC: UICollectionViewDelegate {
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.destination is ViewController,
           let destination = segue.destination as? ViewController,
           let imageGallerySelectedIndexPath = sender as? Int

          {
            destination.imageGallerySelectedIndexPath = imageGallerySelectedIndexPath
            destination.imageGalleryFoto = masImg
            masImg = []


        }
  
    }
    
    
    @objc func onTap(_ recognizer:UITapGestureRecognizer){
        guard let targetView = recognizer.view else {return}
        targetView.removeFromSuperview()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        //print(fotoAlbum[indexPath.item])
        
//        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
//        self.view.addGestureRecognizer(recognizer)
//
//        let fullScreenView = UIView(frame: self.view.bounds)
//
//        let fullScreenImageView = UIImageView(frame: fullScreenView.bounds)
//        fullScreenView.addSubview(fullScreenImageView)
//        let image = fotoAlbum[indexPath.item].url
//
//        fullScreenImageView.contentMode = .scaleAspectFit
//        fullScreenView.backgroundColor = #colorLiteral(red: 0.08336357027, green: 0.1541140378, blue: 0.2033706903, alpha: 1)
//        fullScreenImageView.image = UIImage(named: image)
//        self.view.addSubview(fullScreenView)
//        fullScreenView.addGestureRecognizer(recognizer)
        
        let imageGallerySelectedIndexPath = indexPath.item
        
        
        performSegue(withIdentifier: fromCollectionFriendToGalleryVC, sender: imageGallerySelectedIndexPath )
        
    }
    

}
