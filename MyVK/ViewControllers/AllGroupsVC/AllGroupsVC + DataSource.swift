//
//  AllGroupsVC + DataSource.swift
//  MyVK
//
//  Created by Максим Марков on 07.06.2022.
//

import UIKit
extension AllGroupsVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        groups.count
    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = allGroupsTableView.dequeueReusableCell(withIdentifier: allGroupsCellReuseIdentifier, for: indexPath) as! CustomTableViewCell
        
        cell.configure(self.groups[indexPath.row])


        
        return cell
    }
    
}
