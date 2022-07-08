//
//  likeControlView.swift
//  MyVK
//
//  Created by Максим Марков on 09.06.2022.
//

import UIKit

class likeControlView: UIView {


    @IBOutlet weak var heartImageVIew: UIImageView!
    @IBOutlet weak var heartCounterlabel: UILabel!
    var counter = 0
    var isPressed = false

    // MARK: -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func loadFromXib() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: "likeControlView", bundle: bundle)
        let xibView = xib.instantiate(withOwner: self).first as! UIView
        return xibView
    }
    
    private func setup(){
        let xibView = loadFromXib()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
        heartCounterlabel.text = String(counter)
    }

    
    @IBAction func pressLikeButton(_ sender: Any) {
        isPressed = !isPressed
        likeState()
    }
    
    
    func likeState(){
 
        if isPressed {
            counter+=1
            heartImageVIew.image = UIImage(systemName: "heart.fill")
        } else {
            counter-=1
            heartImageVIew.image = UIImage(systemName: "heart")
        }
        heartCounterlabel.text = String(counter)
        
    }
    func configure(isLiked: Bool, counter:Int){
        self.counter = counter
        isPressed = isLiked
        likeState()
        
    }
    
    
    
}
