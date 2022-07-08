//
//  Friend.swift
//  MyVK
//
//  Created by Максим Марков on 02.06.2022.
//

struct Friend {
    
    var name: String
    var city: String?
    var age: String?
    var avatar: String?
    var fotoAlbom = [MyFoto]()
}

struct MyFoto {
    var url: String
    var isLiked: Bool = false
    var likeCounter: Int = 0
}
