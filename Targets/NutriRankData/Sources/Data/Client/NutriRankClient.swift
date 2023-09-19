//
//  NutriRankClient.swift
//  NutriRankKit
//
//  Created by Paulo Henrique Gomes da Silva on 15/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation
import CloudKit

class NutriRankNuvemClient: ChallengeGroupRepositoryProtocol {
    func createChallengeGroup(group: ChallengeGroup) async -> Result<ChallengeGroup, Error> {
        var groupToSave = ChallengeGroup()
        groupToSave.groupName = group.groupName
        groupToSave.description = group.description
        let database = CKContainer.default().publicCloudDatabase
        do {
            try await groupToSave.save(on: database)
            return .success(groupToSave)
        } catch {
            return .failure(error)
        }
    }

    func fetchChallengeGroups(completion: @escaping (Result<[ChallengeGroup], Error>) -> Void) {

    }
}
