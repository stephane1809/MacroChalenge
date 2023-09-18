//
//  ChallengeGroupUseCase.swift
//  NutriRank
//
//  Created by Paulo Henrique Gomes da Silva on 13/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation
import NutriRankKit

public protocol CreateChallengeGroupUseCase {
    func execute(requestValue: ChallengeGroupUIModel, completion: @escaping (Result<ChallengeGroupUIModel, Error>) -> Void)
}

class DefaultCreateChallengeGroupUseCase: CreateChallengeGroupUseCase {

    let challengeGroupRepository: ChallengeGroupRepositoryProtocol

    init(challengeGroupRepository: ChallengeGroupRepositoryProtocol) {
        self.challengeGroupRepository = challengeGroupRepository
    }
    
    func execute(requestValue: ChallengeGroupUIModel, completion: @escaping (Result<ChallengeGroupUIModel, Error>) -> Void) {
        challengeGroupRepository.createChallengeGroup(group: ChallengeGroup()) { result in
            switch result {
            case .success(let group):
                completion(.success(ChallengeGroupUIModel(name: group.groupName, description: group.description)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
