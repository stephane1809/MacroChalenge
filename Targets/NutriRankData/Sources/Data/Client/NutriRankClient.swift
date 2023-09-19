//
//  NutriRankClient.swift
//  NutriRankKit
//
//  Created by Paulo Henrique Gomes da Silva on 15/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation
import CloudKit
import NutriRankDomain

public class NutriRankNuvemClient: ChallengeGroupRepositoryProtocol {

    public init() {}

    public func createChallengeGroup(group: ChallengeGroup) async -> Result<ChallengeGroup, Error> {
        print("chegou no cliente")
        var groupToSave = ChallengeGroup()
        groupToSave.groupName = group.groupName
        groupToSave.description = group.description
        let database = CKContainer(identifier: "iCloud.NutriRankContainer").publicCloudDatabase
        do {
            try await groupToSave.save(on: database)
            return .success(groupToSave)
        } catch {
            return .failure(error)
        }
    }

    public func fetchChallengeGroups(completion: @escaping (Result<[ChallengeGroup], Error>) -> Void) {

    }
}
