//
//  MyGroupVC.swift
//  MyVK
//
//  Created by Максим Марков on 06.06.2022.
//

import UIKit

class MyGroupVC: UIViewController {
    @IBOutlet weak var searchBarConstrHeight: NSLayoutConstraint!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myGroupTableView: UITableView!
    let myGroupsCellReuseIdentifier = "myGroupsCellReuseIdentifier"
    var groups = [Group]()
    var groupsSearch = [Group]()
   var searchVisible = false
    
    @IBAction func searchButton(_ sender: Any) {
        let widthView = view.bounds.width
        if searchVisible == false {
            UIView.animate(withDuration: 0.5,
                       delay: 0,
                           usingSpringWithDamping: 0.4,
                           initialSpringVelocity: 10,
                           options: [.curveEaseInOut]) { [weak self] in
            self?.searchBarConstrHeight.constant = 51
                
            self?.searchBar.center.x -= widthView
        }
            searchVisible = true
        } else {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           options: [.curveEaseInOut]) { [weak self] in
               self?.searchBar.center.x += widthView
            } completion: { [weak self] _ in
                self?.searchBarConstrHeight.constant = 0
            }
                searchVisible = false
        }
    }
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        myGroupTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: myGroupsCellReuseIdentifier)
        myGroupTableView.dataSource = self
        myGroupTableView.delegate = self
        searchBar.delegate = self

        
        NotificationCenter.default.addObserver(self, selector: #selector(didPressToGroup(_ :)), name: Notification.Name("addInMyGroup"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchBarConstrHeight.constant = 0
        searchBar.center.x += view.bounds.width
    }
    
    @objc func didPressToGroup(_ notification:Notification) {
        guard let group = notification.object as? Group else { return}
        
       // print(groups)
        if !groups.contains(where: {groupItem in
            groupItem.nameGroup == group.nameGroup
        }) {
            groups.append(group)
            groupsSearch = groups
            myGroupTableView.reloadData()
        }
    }
    
    
    // MARK: - deleted from myGroups
        



}


extension MyGroupVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchText.isEmpty {
            groups = groupsSearch
        } else {
            groups = groupsSearch.filter({ friendItem in
                friendItem.nameGroup.lowercased().contains(searchText.lowercased())
            })
            groups = groups.sorted(by: {$0.nameGroup < $1.nameGroup})
        }
        myGroupTableView.reloadData()
    }
}
