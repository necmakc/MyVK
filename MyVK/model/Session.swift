//
//  Session.swift
//  MyVK
//
//  Created by Максим Марков on 07.07.2022.
//fghjk

import Foundation

class Session {
    private init() {}
    
    static let sharedInstance = Session()
    
    var token: String = ""
    let userId: Int = 0
    let userName: String = "user23425"
}
