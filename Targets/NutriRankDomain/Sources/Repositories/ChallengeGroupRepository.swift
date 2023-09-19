//
//  ChallengeGroupRepository.swift
//  NutriRankKit
//
//  Created by Paulo Henrique Gomes da Silva on 13/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation

public protocol ChallengeGroupRepositoryProtocol {
    func fetchChallengeGroups(completion: @escaping (Result<[ChallengeGroup], Error>) -> Void)
    func createChallengeGroup(group: ChallengeGroup) async -> Result<ChallengeGroup, Error>
}

public class DefaultChallengeGroupRepository: ChallengeGroupRepositoryProtocol {

    let data: ChallengeGroupRepositoryProtocol

    public init(data: ChallengeGroupRepositoryProtocol) {
        self.data = data
    }

    public func fetchChallengeGroups(completion: @escaping (Result<[ChallengeGroup], Error>) -> Void) {
        
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

    public func createChallengeGroup(group: ChallengeGroup) async -> Result<ChallengeGroup, Error> {
        print("chegou no repository")
            let result = await data.createChallengeGroup(group: group)
            switch result {
            case .success(let group):
                return .success(group)
            case .failure(let error):
                return .failure(error)
            }
    }
}



