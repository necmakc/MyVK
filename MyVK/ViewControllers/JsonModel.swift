//
//  JsonModel.swift
//  MyVK
//
//  Created by Максим Марков on 16.07.2022.
//

import Foundation

struct JsonModel: Decodable{
    let response: Response
}
struct Response: Decodable{
    let count: Int
    let items: [Items]
}
struct Items: Decodable{
    let id: Int
    let name: String?
    let firstName: String?
    let lastName: String?
    let avatarPhoto: String?
    let sizes: [Sizes]?
    
    enum CodingKeys: String, CodingKey{
        case id,sizes,name
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarPhoto = "photo_100"
    }
}

struct Sizes: Decodable{
    let height: Int
    let width: Int
    let type: String
    let url: String
}
