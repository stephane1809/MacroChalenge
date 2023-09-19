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

    public init(createUseCase: CreateChallengeGroupUseCase) {
        self.createUseCase = createUseCase
    }

    func createGroup() async {
        print("chegou na viewmodel")
        var group = ChallengeGroup()
        group.groupName = "mim de papai"
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
}
