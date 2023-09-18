//
//  ChallengeGroupRepository.swift
//  NutriRankKit
//
//  Created by Paulo Henrique Gomes da Silva on 13/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation
import NutriRankKit

public protocol ChallengeGroupRepositoryProtocol {
    func fetchChallengeGroups(completion: @escaping (Result<[ChallengeGroup], Error>) -> Void)
    func createChallengeGroup(group: ChallengeGroup, completion: @escaping (Result<ChallengeGroup, Error>) -> Void)
}

class DefaultChallengeGroupRepository: ChallengeGroupRepositoryProtocol {
    func fetchChallengeGroups(completion: @escaping (Result<[ChallengeGroup], Error>) -> Void) {

    }

    func createChallengeGroup(group: ChallengeGroup, completion: @escaping (Result<ChallengeGroup, Error>) -> Void) {
        // cria e salva um grupo no cloud kit
    }
}



