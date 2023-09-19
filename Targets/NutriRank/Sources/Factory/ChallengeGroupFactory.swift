//
//  ChallengeGroupFactory.swift
//  NutriRank
//
//  Created by Paulo Henrique Gomes da Silva on 19/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation
import NutriRankData
import NutriRankDomain
import NutriRankPresentation
import SwiftUI

struct ChallengeGroupFactory {
    static func make() -> some View {
        let data = NutriRankNuvemClient()
        let repository = DefaultChallengeGroupRepository(data: data)
        let useCase = DefaultCreateChallengeGroupUseCase(challengeGroupRepository: repository)
        let viewmodel = FeedGroupViewModel(createUseCase: useCase)
        return FeedGroupView(viewmodel: viewmodel)
    }
}
