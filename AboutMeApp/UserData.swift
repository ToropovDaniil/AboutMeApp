//
//  UserData.swift
//  AboutMeApp
//
//  Created by Елена Ажимова  on 11.10.2023.
//

import Foundation

struct LoginData {
    let user: String
    let password: String
    let personalData: PersonalData
}

struct AlertData {
    let title: String
    let message: String
    let okTitle: String
    let forgotTitle: String
}

struct PersonalData {
    let name: String
    let surname: String
    let photo: String
    let company: String
    let department: String
    let position: String
}

struct Biography {
    let desription: String
}


