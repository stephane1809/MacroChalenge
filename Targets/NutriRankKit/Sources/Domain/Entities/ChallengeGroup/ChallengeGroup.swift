//
//  ChallengeGroupModel.swift
//  NutriRankKit
//
//  Created by Paulo Henrique Gomes da Silva on 12/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation
import Nuvem
import CloudKit

struct ChallengeGroup: CKModel {
    var record: CKRecord!

    init() {}

    @CKField("groupName")
    var groupName: String

    @CKField("description")
    var description: String
}
