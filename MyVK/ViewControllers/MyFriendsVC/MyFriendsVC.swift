//
//  myFriendsVC.swift
//  MyVK
//
//  Created by Максим Марков on 02.06.2022.
//

import UIKit

class MyFriendsVC: UIViewController {

    var searchVisible = false
    
    @IBOutlet weak var searchBarConstrHeight: NSLayoutConstraint!
    @IBOutlet var myFriendView: UIView!
    @IBOutlet weak var searchFriend: UISearchBar!
    @IBOutlet weak var friendTableView: UITableView!
    
    let friendCellReuseIdentifier = "friendCellReuseIdentifier"
    let fromMyFriendsToCollectionSegue = "fromMyFriendsToCollectionSegue"

    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        myFriends = fillData()
        myFriends = myFriends.sorted(by: {$0.name < $1.name})
        friendTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: friendCellReuseIdentifier)
        
        friendTableView.dataSource = self
        friendTableView.delegate = self
        searchFriend.delegate = self
        self.navigationController?.delegate = self
        myFriendsSearch = myFriends
        
        let request = Requests()
        request.getFriendList()
        request.getPhotos(idUser: "12345")
        request.getGroupsList()
        request.searchGlobalGroups(searchByWord: "Music")
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // searchFriend.alpha = 0
        searchBarConstrHeight.constant = 0
        searchFriend.center.x += view.bounds.width
    }
  
    
    @IBAction func searchButton(_ sender: Any) {
        let widthView = view.bounds.width
        if searchVisible == false {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.4,
                           initialSpringVelocity: 10,
                           options: []) { [weak self] in
            self?.searchBarConstrHeight.constant = 51
            self?.searchFriend.center.x -= widthView
        }
            searchVisible = true
        } else {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           options: [.curveEaseInOut]) { [weak self] in
               self?.searchFriend.center.x += widthView
            } completion: { [weak self] _ in
                self?.searchBarConstrHeight.constant = 0
            }
                searchVisible = false
        }
        
        }
    
    // MARK: - functions
    
    func fillData() -> [Friend] {
        let myFoto1 = MyFoto(url: "avatar1")
        let myFoto2 = MyFoto(url: "avatar2")
        let myFoto3 = MyFoto(url: "avatar3")
        let myFoto4 = MyFoto(url: "avatar4")
        let myFoto5 = MyFoto(url: "avatar5")
        let myFoto6 = MyFoto(url: "avatar6")
        let myFoto7 = MyFoto(url: "avatar7")
        let myFoto8 = MyFoto(url: "avatar8")
        let myFoto9 = MyFoto(url: "avatar9")
        let myFoto10 = MyFoto(url: "avatar10")
        let myFoto11 = MyFoto(url: "avatar11")
        let myFoto12 = MyFoto(url: "avatar12")
        let myFoto13 = MyFoto(url: "avatar13")
        
        let friend1 = Friend(
            name: "Иванова Мария",
            city: "Москва",
            age: "24",
            avatar: "avatar1",
            fotoAlbom: [myFoto1,myFoto2,myFoto3])
        let friend2 = Friend(
            name: "Сидорова Анна",
            city: "Серпухов",
            age: "31",
            avatar:"avatar2",
            fotoAlbom: [myFoto2,myFoto4,myFoto5,myFoto6,myFoto7])
        let friend3 = Friend(
            name: "Мельникова Инна",
            city: "Санкт-Петербург",
            age: "28",
            avatar: "avatar3",
            fotoAlbom: [myFoto3,myFoto9,myFoto10,myFoto11])
        let friend4 = Friend(
            name: "Марков Максим",
            city: "Нижний Новогород",
            age: "31",
            avatar: "avatar4",
            fotoAlbom: [myFoto4,myFoto12,myFoto13])
        let friend5 = Friend(
            name: "Кукина Виктория",
            city: "Липецк",
            age: "30",
            avatar: "avatar5",
            fotoAlbom: [myFoto5])
        let friend6 = Friend(
            name: "Лебедев Александр",
            city: "Москва",
            age: "26",
            avatar: "avatar6",
            fotoAlbom: [myFoto6])
        let friend7 = Friend(
            name: "Прокофьева Анастасия",
            city: "Брянск",
            age: "25",
            avatar: "avatar7",
            fotoAlbom: [myFoto7])
        let friend8 = Friend(
            name: "Ефимочкина Татьяна",
            city: "Серпухов",
            age: "31",
            avatar: "avatar8",
            fotoAlbom: [myFoto8])
        let friend9 = Friend(
            name: "Чумачечий Владимир",
            city: "Москва",
            age: "22",
            avatar: "avatar9",
            fotoAlbom: [myFoto9])
        let friend10 = Friend(
            name: "Чеширская Евгения",
            city: "Сочи",
            age: "36",
            avatar: "avatar10",
            fotoAlbom: [myFoto10])
        let friend11 = Friend(
            name: "Королев Вадим",
            city: "Анапа",
            age: "28",
            avatar: "avatar11",
            fotoAlbom: [myFoto11])
        let friend12 = Friend(
            name: "Александрова Александра",
            city: "Владимир",
            age: "19",
            avatar: "avatar12",
            fotoAlbom: [myFoto1,myFoto2,myFoto3,myFoto4,myFoto5,myFoto6,myFoto7,myFoto8,myFoto9,myFoto10,myFoto11,myFoto12,myFoto13])
        let friend13 = Friend(
            name: "Летучий Голандец",
            city: "Казань",
            age: "38",
            avatar: "avatar13",
            fotoAlbom: [myFoto13])
        
        var friendsArray = [Friend]()
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        friendsArray.append(friend4)
        friendsArray.append(friend5)
        friendsArray.append(friend6)
        friendsArray.append(friend7)
        friendsArray.append(friend8)
        friendsArray.append(friend9)
        friendsArray.append(friend10)
        friendsArray.append(friend11)
        friendsArray.append(friend12)
        friendsArray.append(friend13)
        return friendsArray
    }
    var myFriends = [Friend]()
    var myFriendsSearch = [Friend]()
    
    
// MARK: - deleted from friends
    
   func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myFriends.remove(at: indexPath.row)
            tableView.deleteRows(
                at: [indexPath],
                with: .fade)
        }
    }


    
}

extension MyFriendsVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchText.isEmpty {
            myFriends = myFriendsSearch
        } else {
            myFriends = myFriendsSearch.filter({ friendItem in
                friendItem.name.lowercased().contains(searchText.lowercased())
               // friendItem.name.sort(by: {$0.name < $1.name})
            })
            myFriends = myFriends.sorted(by: {$0.name < $1.name})
        }
        friendTableView.reloadData()
    }
}





