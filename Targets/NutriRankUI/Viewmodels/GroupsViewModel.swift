//
//  GroupsViewModel.swift
//  NutriRankKit
//
//  Created by Paulo Henrique Gomes da Silva on 04/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation

public class GroupsViewModel: ObservableObject {

    @Published var groups: [GroupNutri] = []

    public init() {}

    func createGroup(users: [UserNutri], groupName: String) {
        print("Grupo criado!")
        groups.append(GroupNutri(name: groupName, users: users))
    }

}
