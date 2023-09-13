//
//  ChallengeMember.swift
//  NutriRankKit
//
//  Created by Paulo Henrique Gomes da Silva on 12/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation
import Nuvem
import CloudKit

struct Member: CKModel {
    var record: CKRecord!

    init() {}


    @CKField("name")
    var name: String

    @CKField("score")
    var score: Int

    @CKField("avatar")
    var avatar: String

    @CKReferenceField("challengeGroup")
    var challengeGroup: ChallengeGroup?
}
