//
//  UserData.swift
//  AboutMeApp
//
//  Created by Торопов Даниил  on 11.10.2023.
//

import Foundation

struct LoginData {
    let user: String
    let password: String
    let personalData: PersonalData
    
    static func getLoginData() -> LoginData {
        LoginData(
            user: "User",
            password: "Password",
            personalData: PersonalData.getPersonalData())
    }
}

struct PersonalData {
    let name: String
    let surname: String
    let photo: String
    let company: Company
    let biography: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPersonalData() -> PersonalData {
        PersonalData(
            name: "Daniil",
            surname: "Toropov",
            photo: "avatar",
            company: Company.getCompany(),
            biography: "Всем привет, меня зовут Даниил, и на текущий момент я являюсь работающим студентом, обучаюсь я, к слову, в школе SwiftBook. Живу в городе Москва, но родился и вырос в Тюмени, по образованию я - геоэколог:)")
    }
}

struct Company {
    let title: String
    let department: String
    let position: String
    
    static func getCompany() -> Company {
        Company(
            title: "Pixar",
            department: "Toy Story",
            position: "IOS Developer")
    }
}
