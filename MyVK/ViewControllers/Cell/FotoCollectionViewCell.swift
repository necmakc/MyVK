//
//  FotoCollectionViewCell.swift
//  MyVK
//
//  Created by Максим Марков on 05.06.2022.
//

import UIKit

class FotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var likeControlView: likeControlView!
    //let likeBarRadius: CGFloat = 50
    
    @IBOutlet weak var fotoImageView: UIImageView!
    

    @IBOutlet weak var likeBarView: UIView!{
        didSet{
            likeBarView.layer.cornerRadius = 10
            likeBarView.layer.opacity = 0.6
            


        }
    }

   
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fotoImageView.image = nil
        likeControlView.configure(isLiked: false, counter: 0)
        
    }
    
    func configure (image: UIImage?, isLiked: Bool, likeCounter: Int){
        fotoImageView.image = image
        likeControlView.configure(isLiked: isLiked, counter: likeCounter)
        
    }

}
