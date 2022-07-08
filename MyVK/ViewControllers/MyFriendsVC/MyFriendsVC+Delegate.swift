//
//  MyFriendsVC+Delegate.swift
//  MyVK
//
//  Created by Максим Марков on 05.06.2022.
//

import UIKit
extension MyFriendsVC:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == fromMyFriendsToCollectionSegue,
           let destinationController = segue.destination as? CollectionFriendVC,
           let fotos = sender as? [MyFoto]{
            destinationController.fotoAlbum = fotos
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
       // let fotos = myFriends[indexPath.row].fotoAlbom
       // performSegue(withIdentifier: fromMyFriendsToCollectionSegue, sender: fotos)
        
    }
    


    
}
