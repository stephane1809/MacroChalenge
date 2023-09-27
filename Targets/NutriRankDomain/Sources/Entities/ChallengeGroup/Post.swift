//
//  Post.swift
//  NutriRankKit
//
//  Created by Paulo Henrique Gomes da Silva on 12/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation
import CloudKit
import Nuvem

public struct Post: CKModel {
    public var record: CKRecord!

    public init() {}

    @CKField("title")
    var title: String

    @CKField("description")
    var description: String

    @CKField("upVote")
    var upVote: Int

    @CKField("downVote")
    var downVote: Int

    @CKField("image")
    var image: String

}
