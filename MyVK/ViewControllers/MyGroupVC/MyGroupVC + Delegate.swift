//
//  MyGroupVC + Delegate.swift
//  MyVK
//
//  Created by Максим Марков on 07.06.2022.
//

import UIKit

extension MyGroupVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        110
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
}
