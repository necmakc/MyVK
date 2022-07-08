//
//  AllGroupsVC + Delegate.swift
//  MyVK
//
//  Created by Максим Марков on 07.06.2022.
//

import UIKit
extension AllGroupsVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        110
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        let group = groups[indexPath.item]

       // groups[indexPath.row].imageGroup = "ok"
       // allGroupsTableView.reloadData()

        NotificationCenter.default.post(name: Notification.Name("addInMyGroup"), object: group)
    }

    
}
