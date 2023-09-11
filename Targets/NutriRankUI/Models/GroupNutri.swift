//
//  Group.swift
//  NutriRankKit
//
//  Created by Paulo Henrique Gomes da Silva on 04/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation

struct GroupNutri: Identifiable {
    var id: UUID = UUID()
    let name: String
    let users: [UserNutri]
    let posts: [PostNutri] = [PostNutri]()
}
// GroupNutri -- CKRecord
    // user: -- [CKRecord.Reference]
