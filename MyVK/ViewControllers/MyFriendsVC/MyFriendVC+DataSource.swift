//
//  MyFriendVC+DataSource.swift
//  MyVK
//
//  Created by Максим Марков on 05.06.2022.
//

import UIKit
extension MyFriendsVC: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return myFriends.count
    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = friendTableView.dequeueReusableCell(withIdentifier: friendCellReuseIdentifier,
                                                          for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        let friend = myFriends[indexPath.row]
        cell.configure(image: UIImage(named: friend.avatar!), name: friend.name, age: friend.age, city: friend.city, closure: { [weak self] in
            let fotos = self?.myFriends[indexPath.row].fotoAlbom
            guard let self = self else {return}
            self.performSegue(withIdentifier: self.fromMyFriendsToCollectionSegue, sender: fotos)
        })
        
        return cell
    }
}
