//
//  ChallengeGroupViewModel.swift
//  NutriRankUI
//
//  Created by Paulo Henrique Gomes da Silva on 13/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation
import NutriRankKit

class ChallengeGroupViewModel {
    let challengeGroupUseCase: CreateChallengeGroupUseCase

    init(challengeGroupUseCase: CreateChallengeGroupUseCase) {
        self.challengeGroupUseCase = challengeGroupUseCase
    }
}
