//
//  ChallengeGroupRepository.swift
//  NutriRankKit
//
//  Created by Paulo Henrique Gomes da Silva on 13/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation

protocol ChallengeGroupRepositoryProtocol {
    func fetchChallengeGroups(completion: @escaping (Result<[ChallengeGroup], Error>) -> Void)
    func createChallengeGroup(group: ChallengeGroup) async -> Result<ChallengeGroup, Error>
}

class DefaultChallengeGroupRepository: ChallengeGroupRepositoryProtocol {

    let data: ChallengeGroupRepositoryProtocol

    init(data: ChallengeGroupRepositoryProtocol) {
        self.data = data
    }

    func fetchChallengeGroups(completion: @escaping (Result<[ChallengeGroup], Error>) -> Void) {
        
    }

//    func createChallengeGroup(group: ChallengeGroup, completion: @escaping (Result<ChallengeGroup, Error>) -> Void) {
//        client.createChallengeGroup(group: group) { result in
//            switch result {
//            case .success(let group):
//                completion(.success(group))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }

    func createChallengeGroup(group: ChallengeGroup) async -> Result<ChallengeGroup, Error> {
            let result = await data.createChallengeGroup(group: group)
            switch result {
            case .success(let group):
                return .success(group)
            case .failure(let error):
                return .failure(error)
            }
    }
}



