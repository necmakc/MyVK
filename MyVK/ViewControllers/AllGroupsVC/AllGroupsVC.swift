//
//  AllGroupsVC.swift
//  MyVK
//
//  Created by Максим Марков on 06.06.2022.
//

import UIKit

class AllGroupsVC: UIViewController {
    @IBOutlet weak var allGroupsTableView: UITableView!
    let allGroupsCellReuseIdentifier = "allGroupsCellReuseIdentifier"
    
    func fillData() -> [Group] {
        let group1 = Group(
            nameGroup: "Наука и техника",
            descriptionGroup: "Первый познавательный паблик ВКонтакте",
            imageGroup: "group1")
        let group2 = Group(
            nameGroup: "Интересные факты",
            descriptionGroup: "Интересные факты со всей планеты собраны в одном месте!",
            imageGroup: "group2")
        let group3 = Group(
            nameGroup: "Улыбнуло",
            descriptionGroup: "Самое интересное и смешное!",
            imageGroup: "group3")
        let group4 = Group(
            nameGroup: "Не очень-то веселые факты",
            descriptionGroup: "То, чего вы не знали",
            imageGroup: "group4")
        let group5 = Group(
            nameGroup: "Бизнес идеи",
            descriptionGroup: "Пишем о бизнесе доступным языком. Идеи стартапов, мировые новости и профессиональный юмор.",
            imageGroup: "group5")
        let group6 = Group(
            nameGroup: "KudaGo: Москва",
            descriptionGroup: "Афиша Москвы: интересные места и события. Советуем, куда сходить в Москве.",
            imageGroup: "group6")
        let group7 = Group(
            nameGroup: "Радиолюбитель",
            descriptionGroup: "Информация для тех, кто тем или иным способом связан с компьютерной техникой",
            imageGroup: "group7")
        let group8 = Group(
            nameGroup: "Строим для себя",
            descriptionGroup: "Для обсуждения проекта Строим для себя: ",
            imageGroup: "group9")
        let group9 = Group(
            nameGroup: "Сушимания",
            descriptionGroup: "Доставка самых вкусных роллов и суши",
            imageGroup: "group8")
        let group10 = Group(
            nameGroup: "Программирование",
            descriptionGroup: "Всё о программировании",
            imageGroup: "group10")
        
        var groups = [Group]()
        groups.append(group1)
        groups.append(group2)
        groups.append(group3)
        groups.append(group4)
        groups.append(group5)
        groups.append(group6)
        groups.append(group7)
        groups.append(group8)
        groups.append(group9)
        groups.append(group10)
        return groups
    }
    
    var groups = [Group]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = fillData()

        allGroupsTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: allGroupsCellReuseIdentifier)
        allGroupsTableView.dataSource = self
        allGroupsTableView.delegate = self
    }
    



}





