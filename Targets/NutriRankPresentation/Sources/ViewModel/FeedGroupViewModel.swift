//
//  FeedGroupViewModel.swift
//  NutriRankPresentation
//
//  Created by Paulo Henrique Gomes da Silva on 19/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation
import NutriRankDomain

public class FeedGroupViewModel: ObservableObject {
    @Published var groups: [ChallengeGroup] = []

    let createUseCase: CreateChallengeGroupUseCase
    let fetchUseCase: FetchChallengeGroupsUseCase

    public init(createUseCase: CreateChallengeGroupUseCase, fetchUseCase: FetchChallengeGroupsUseCase) {
        self.createUseCase = createUseCase
        self.fetchUseCase = fetchUseCase
    }

    func createGroup() async {
        print("chegou na viewmodel")
        var group = ChallengeGroup()
        group.groupName = "deu de novo"
        group.description = "testando"
        let result = await createUseCase.execute(requestValue: group)
        switch result {
        case .success(let group):
            DispatchQueue.main.async {
                self.groups.append(group)
            }
        case .failure(let error):
            print(error)
        }
    }

    func fetchGroup() async {
        print("o fetch chegou na viewmodel")
        let result = await fetchUseCase.execute()
        switch result {
            case .success(let groupList):
                DispatchQueue.main.async {
                    self.groups = groupList
                }
            case .failure(let error):
                print(error)
        }


    }
}
