//
//  UserModel.swift
//  LogInApp
//
//  Created by Aleksandr Kretov on 11.03.2022.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func createUser() -> User {
        User(login: "alex", password: "123", person: Person.createPerson())
    }
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let city: String
    let company: String
    let photo: String
    let description: String
    
    static func createPerson() -> Person {
            Person(name: "Aleksander",
                                surname: "Kretov",
                                age: 33,
                                city: "Chelyabinsk",
                                company: "PJC Fortum",
                                photo: "me",
                                description: "Hello! My name is Aleksander, as You can easily guess 😄 . I'am 33 years old man from severe city Chelyabinsk. I work for a huge enery company as Power Plant Unit Operator for 13 years. As for the hobbies: i like to play electric guitar for a long winters evenings 🤟🏼, and at the summer we are sailing with my friends. But right now, I don't have any free time 🤣 Couple of months ago I decided that I want to change something in my life. About 15 years ago I was very interested in programming, so good friend of mine, told me to learn Swift. So here I'am 😅 I will do my best.")
    }
}
