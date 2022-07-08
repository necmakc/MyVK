//
//  CollectionFriendVC+DelegateFlowLayout.swift
//  MyVK
//
//  Created by Максим Марков on 05.06.2022.
//

import UIKit
extension CollectionFriendVC: UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let width = collectionView.bounds.width
        let whiteSpaces: CGFloat = 10
        let celWidth = width/3 - whiteSpaces
        return CGSize(width: celWidth, height: celWidth)
    
        
        
    }
    
}
