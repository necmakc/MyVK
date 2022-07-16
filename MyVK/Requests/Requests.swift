//
//  Requests.swift
//  MyVK
//
//  Created by Максим Марков on 12.07.2022.
//

import Foundation

class Requests {
    
func getFriendList() {

    let configuration = URLSessionConfiguration.default // собственная сессия
    let session = URLSession(configuration: configuration)
    
    // создаем конструктор для URL
    var urlConstructor = URLComponents(string: "http://api.vk.com/method/friends.get") // устанавливаем схему
    urlConstructor?.queryItems = [
        URLQueryItem(name: "access_token", value: Session.sharedInstance.token),
        URLQueryItem(name: "fields", value: "nickname"),
        URLQueryItem(name: "count", value: "25"),
        URLQueryItem(name: "v", value: "5.131")
    ]

    // задача для запуска
    let task = session.dataTask(with: urlConstructor!.url!) { (data, response, error) in
        if let error = error {
            print(error)
            return
        }
        guard let data = data else {
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let friensJson = try decoder.decode(JsonModel.self, from: data)
            let friendsArray = friensJson.response.items.map{ "\($0.lastName!) \($0.firstName!)"}
        print(friendsArray)
        }catch{
            print(error)
        }
    }
    task.resume()


}

    
    func getPhotos(idUser: String){
        
    let configuration = URLSessionConfiguration.default // собственная сессия
    let session = URLSession(configuration: configuration)
    var urlConstructor = URLComponents() // устанавливаем схему
        
    urlConstructor.scheme = "http"
    urlConstructor.host = "api.vk.com" // путь
    urlConstructor.path = "/method/photos.getAll" // параметры для запроса
    urlConstructor.queryItems = [
        URLQueryItem(name: "access_token", value: Session.sharedInstance.token),
        URLQueryItem(name: "owner_id", value: idUser),
        URLQueryItem(name: "v", value: "5.131")
    ]

    // задача для запуска
    let task = session.dataTask(with: urlConstructor.url!) { (data, response, error) in
        
        if let error = error {
            print(error)
            return
        }
        guard let data = data else { return }
        
        do {
            let decoder = JSONDecoder()
            let photosJson = try decoder.decode(JsonModel.self, from: data)
            let photoArray = photosJson.response.items.map{$0.sizes!.first!.url}
            
                print(photoArray)
        }catch{
            print(error)
        }
    }
    // запускаем задачу
    task.resume()
}
  
    func getGroupsList() {

        let configuration = URLSessionConfiguration.default // собственная сессия
        let session = URLSession(configuration: configuration)
        
        // создаем конструктор для URL
        var urlConstructor = URLComponents(string: "http://api.vk.com/method/groups.get")
        urlConstructor?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.sharedInstance.token),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.131")
        ]

        // задача для запуска
        let task = session.dataTask(with: urlConstructor!.url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                return
            }
 
            do {
                let decoder = JSONDecoder()
                let groupJson = try decoder.decode(JsonModel.self, from: data)
                let groupsArray = groupJson.response.items.map { "\($0.name!) \($0.avatarPhoto!) "}
            print(groupsArray)
            }catch{
                print(error)
            }
        }
        task.resume()


    }
    
    func searchGlobalGroups(searchByWord: String) {

        let configuration = URLSessionConfiguration.default // собственная сессия
        let session = URLSession(configuration: configuration)
        
        // создаем конструктор для URL
        var urlConstructor = URLComponents(string: "http://api.vk.com/method/groups.search")
        urlConstructor?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.sharedInstance.token),
            URLQueryItem(name: "q", value: searchByWord),
            URLQueryItem(name: "type", value: "group"),
            URLQueryItem(name: "count", value: "20"),
            URLQueryItem(name: "v", value: "5.131")
        ]

        // задача для запуска
        let task = session.dataTask(with: urlConstructor!.url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                return
            }
 
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(JsonModel.self, from: data)
                let searchArray = json.response.items.map {$0.name!}
            print(searchArray)
            }catch{
                print(error)
            }
        }
        task.resume()


    }
    
//account.getProfileInfo
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
    let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
    // выводим в консоль
       // print(String(data: data!, encoding: .utf8))
        print(json)
        
    }
    // запускаем задачу
    task.resume()
}

}
