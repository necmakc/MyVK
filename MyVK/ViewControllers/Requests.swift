//
//  Requests.swift
//  MyVK
//
//  Created by Максим Марков on 12.07.2022.
//

import Foundation

class Requests {
    
    
    //Список друзей
    func getFriendList() {
        
        let configuration = URLSessionConfiguration.default // собственная сессия
        let session = URLSession(configuration: configuration)
        // создаем конструктор для URL
        var urlConstructor = URLComponents() // устанавливаем схему
        urlConstructor.scheme = "http"
        // устанавливаем хост
        urlConstructor.host = "api.vk.com" // путь
        urlConstructor.path = "/method/friends.get" // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.sharedInstance.token),
            URLQueryItem(name: "fields", value: "nickname"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        

        // задача для запуска
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
        // в замыкании данные, полученные от сервера, мы преобразуем в json
            guard let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) else { return }
        // выводим в консоль
        print(json)
            
        }
        // запускаем задачу
        task.resume()
    }
    
    //Информация о пользователе
    func getProfileInfo(){
        let configuration = URLSessionConfiguration.default // собственная сессия
        let session = URLSession(configuration: configuration)
        // создаем конструктор для URL
        var urlConstructor = URLComponents() // устанавливаем схему
        urlConstructor.scheme = "http"
        // устанавливаем хост
        urlConstructor.host = "api.vk.com" // путь
        urlConstructor.path = "/method/account.getProfileInfo" // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "access_token", value: Session.sharedInstance.token),
            URLQueryItem(name: "v", value: "5.131")
        ]

        // задача для запуска
        let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
        // в замыкании данные, полученные от сервера, мы преобразуем в json
            guard let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) else { return }
        // выводим в консоль
           // print(String(data: data!, encoding: .utf8))
            print(json)
            
        }
        // запускаем задачу
        task.resume()
    }
}

//Фото пользователя
func getPhotoUser() {
    let configuration = URLSessionConfiguration.default // собственная сессия
    let session = URLSession(configuration: configuration)
    // создаем конструктор для URL
    var urlConstructor = URLComponents() // устанавливаем схему
    urlConstructor.scheme = "http"
    // устанавливаем хост
    urlConstructor.host = "api.vk.com" // путь
    urlConstructor.path = "/method/photos.getAll" // параметры для запроса
    urlConstructor.queryItems = [
        URLQueryItem(name: "access_token", value: Session.sharedInstance.token),
        URLQueryItem(name: "owner_id", value: "4766757"),
        URLQueryItem(name: "v", value: "5.131")
    ]

    // задача для запуска
    let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
    // в замыкании данные, полученные от сервера, мы преобразуем в json
        guard let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) else { return }
    // выводим в консоль
       // print(String(data: data!, encoding: .utf8))
        print(json)
        
    }
    // запускаем задачу
    task.resume()
}

func getGroupsUser() {
    let configuration = URLSessionConfiguration.default // собственная сессия
    let session = URLSession(configuration: configuration)
    // создаем конструктор для URL
    var urlConstructor = URLComponents() // устанавливаем схему
    urlConstructor.scheme = "http"
    // устанавливаем хост
    urlConstructor.host = "api.vk.com" // путь
    urlConstructor.path = "/method/groups.get" // параметры для запроса
    urlConstructor.queryItems = [
        URLQueryItem(name: "access_token", value: Session.sharedInstance.token),
        URLQueryItem(name: "v", value: "5.131")
    ]

    // задача для запуска
    let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
    // в замыкании данные, полученные от сервера, мы преобразуем в json
        guard let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) else { return }
    // выводим в консоль
       // print(String(data: data!, encoding: .utf8))
        print(json)
        
    }
    // запускаем задачу
    task.resume()
}

func getSearchGroup() {
    let configuration = URLSessionConfiguration.default // собственная сессия
    let session = URLSession(configuration: configuration)
    // создаем конструктор для URL
    var urlConstructor = URLComponents() // устанавливаем схему
    urlConstructor.scheme = "http"
    // устанавливаем хост
    urlConstructor.host = "api.vk.com" // путь
    urlConstructor.path = "/method/search.getHints" // параметры для запроса
    urlConstructor.queryItems = [
        URLQueryItem(name: "access_token", value: Session.sharedInstance.token),
        URLQueryItem(name: "q", value: "API"),
        URLQueryItem(name: "limit", value: "15"),
        URLQueryItem(name: "search_global", value: "1"),
        URLQueryItem(name: "fields", value: "type=group")
    ]

    // задача для запуска
    let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
    // в замыкании данные, полученные от сервера, мы преобразуем в json
        guard let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) else { return }
    // выводим в консоль
       // print(String(data: data!, encoding: .utf8))
        print(json)
        
    }
    // запускаем задачу
    task.resume()
}
