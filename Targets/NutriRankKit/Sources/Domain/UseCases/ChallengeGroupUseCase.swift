//
//  ChallengeGroupUseCase.swift
//  NutriRank
//
//  Created by Paulo Henrique Gomes da Silva on 13/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation

public protocol CreateChallengeGroupUseCase {
    func execute(requestValue: ChallengeGroup) async -> Result<ChallengeGroup, Error>
}

class DefaultCreateChallengeGroupUseCase: CreateChallengeGroupUseCase {

    let challengeGroupRepository: ChallengeGroupRepositoryProtocol
//    let challengeGroupViewModel:

    init(challengeGroupRepository: ChallengeGroupRepositoryProtocol) {
        self.challengeGroupRepository = challengeGroupRepository
    }
    
    func execute(requestValue: ChallengeGroup) async -> Result<ChallengeGroup, Error> {
        let result  = await challengeGroupRepository.createChallengeGroup(group: requestValue)
        switch result {
        case .success(let group):
            return .success(group)
        case .failure(let error):
            return .failure(error)
        }

//        challengeGroupRepository.createChallengeGroup(group: requestValue) {
//            switch result {
//            case .success(let group):
//                completion(.success(group))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
    }
}
