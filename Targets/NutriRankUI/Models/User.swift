//
//  User.swift
//  NutriRankKit
//
//  Created by Paulo Henrique Gomes da Silva on 04/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation

struct UserNutri {
    let id = UUID()
    let name: String
    let username: String

    static var users: [UserNutri] = [
        UserNutri(name: "teste1", username: "teste1"),
        UserNutri(name: "teste2", username: "teste2"),
        UserNutri(name: "teste3", username: "teste3")
    ]
}
