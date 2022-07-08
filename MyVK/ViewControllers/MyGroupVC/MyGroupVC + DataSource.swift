//
//  MyGroupVC + DataSource.swift
//  MyVK
//
//  Created by Максим Марков on 07.06.2022.
//

import UIKit

extension MyGroupVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        groups.count
    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = myGroupTableView.dequeueReusableCell(withIdentifier: myGroupsCellReuseIdentifier, for: indexPath) as! CustomTableViewCell
        
        cell.configure(self.groups[indexPath.row])


        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                             commit editingStyle: UITableViewCell.EditingStyle,
                             forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
             groups.remove(at: indexPath.row)
             tableView.deleteRows(
                 at: [indexPath],
                 with: .fade)
         }
     }
    
}
