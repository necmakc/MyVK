//
//  CustomTableViewCell.swift
//  MyVK
//
//  Created by Максим Марков on 02.06.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var closure: (() -> Void)?
    @IBOutlet weak var avatarImageView : UIImageView! {
        didSet {
            avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 4
            avatarImageView.layer.borderWidth = 1
            avatarImageView.layer.masksToBounds = true

        }
    }
    @IBOutlet weak var shadowAvatarView: UIView! {
        didSet {
            shadowAvatarView.layer.cornerRadius = self.bounds.height/2
            shadowAvatarView.layer.shadowColor = UIColor.black.cgColor
            shadowAvatarView.layer.shadowRadius = 4
            shadowAvatarView.layer.shadowOpacity = 1
            shadowAvatarView.layer.shadowOffset = CGSize(width: 0.0, height: -3)
            shadowAvatarView.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var nameFriendLabel: UILabel!
    @IBOutlet weak var cityFriendLabel: UILabel!
    @IBOutlet weak var imageOk: UIImageView!
    @IBOutlet weak var ageFriendLabel: UILabel!
    
    @IBAction func pressToImage(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: []) { [weak self] in
            self?.avatarImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        } completion: { [weak self] _ in
            UIView.animate(withDuration: 0.2) {
                self?.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            } completion: { [weak self] _ in
                self?.closure?()
            }

        }

        
        
    }
    
    override func prepareForReuse() {
        avatarImageView.image = nil
        nameFriendLabel.text = nil
        ageFriendLabel.text = nil
        closure = nil
        
    }
    
    
    
    func configure(image : UIImage?, name: String?, age: String?, city: String?, closure: @escaping () -> Void){
        nameFriendLabel.text = name
        avatarImageView.image = image
        ageFriendLabel.text = age
        cityFriendLabel.text = city
        self.closure = closure
        
        if let avatarImageView = avatarImageView {
            avatarImageView.image = image
        }
        else {
            avatarImageView.image = UIImage(named: "avatarDefault")
        }
        
//        if let cityFriendLabel = cityFriendLabel {
//            cityFriendLabel.text = description
//            cityFriendLabel.textColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
//        }
//        else {
//            cityFriendLabel.text = "no description"
//            cityFriendLabel.textColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
//        }
    }
    
    func configure(_ group: Group) {
        nameFriendLabel.text = group.nameGroup
        avatarImageView.image = UIImage(named: group.imageGroup)
        if let description = group.descriptionGroup {
            cityFriendLabel.text = description
            cityFriendLabel.textColor = UIColor.lightGray
        }
        else {
            cityFriendLabel.text = "No discription"
            cityFriendLabel.textColor = UIColor.red
        }
    }
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
