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
    @Published var posts: [Post] = []

    let createUseCase: CreateChallengeGroupUseCase
    let createPostUseCase: CreateChallengePostUseCase

    public init(createUseCase: CreateChallengeGroupUseCase, createPostUseCase: CreateChallengePostUseCase) {
        self.createUseCase = createUseCase
        self.createPostUseCase = createPostUseCase
    }

    func createGroup(groupName: String, description: String) async {
        print("chegou na viewmodel")
        var group = ChallengeGroup()
        group.groupName = groupName
        group.description = description
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

    func createPost(title: String, description: String) async {
        var post = Post()
        post.description = description
        post.title = title
        let result = await createPostUseCase.execute(post)
        switch result {
        case .success(let post):
            DispatchQueue.main.async {
                self.posts.append(post)
            }
        case .failure(let error):
            print(error)
        }
    }
}
