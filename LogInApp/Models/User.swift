//
//  UserModel.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 11.03.2022.
//

import Foundation
import UIKit

struct User {
    let login: String
    let paswword: String
    let person: Person
    static let users = [
        User(login: "tim", paswword: "123", person: Person(name: "Tim", surname: "Cook", age: 61, sex: .male, job: "Apple Inc.", hobby: .painting, photo: "TimCook")),
                    User(login: "phil", paswword: "000", person: Person(name: "Phil", surname: "Schiller", age: 61, sex: .male, job: "Apple Inc", hobby: .singing, photo: "Phil")),
                         User(login: "jason", paswword: "321", person: Person(name: "Jason", surname: "Stetham", age: 52, sex: .male, job: "WB", hobby: .singing, photo: "Phil"))
    ]
    
    func createUsers() -> [User] {
        [
            User(login: "tim", paswword: "123", person: Person(name: "Tim", surname: "Cook", age: 61, sex: .male, job: "Apple Inc.", hobby: .painting, photo: "TimCook")),
            User(login: "phil", paswword: "000", person: Person(name: "Phil", surname: "Schiller", age: 61, sex: .male, job: "Apple Inc", hobby: .singing, photo: "phil")),
            User(login: "jason", paswword: "321", person: Person(name: "Jason", surname: "Stetham", age: 52, sex: .male, job: "WB", hobby: .singing, photo: "phil"))
        ]
    }


struct Person {
    let name: String
    let surname: String
    let age: Int
    let sex: Sex
    let job: String
    let hobby: Hobbies
    let photo: String
}

enum Sex: String {
    case male = "Мужской"
    case female = "Женский"
}

enum Hobbies: String {
    case painting = "Рисование"
    case sports = "Заниматься спортом"
    case handcrafting = "Делать что-то своими руками"
    case singing = "Петь"
    case playMusicInstruments = "Играть на музыкальных инструментах"
}

//enum Sport: String {
//    case running = "Бегать"
//    case sailing = "Парусным спортом"
//    case swimming = "Плаванием"
//    case bodybuilding = "Бодибилдингом"
//    case fitness = "Фитнесом"
//}
//enum Instuments: String {
//    case guitar = "Играть на гитаре"
//    case piano = "Играть на пианино"
//}
}
