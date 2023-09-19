//
//  FeedGroupView.swift
//  NutriRankPresentation
//
//  Created by Paulo Henrique Gomes da Silva on 19/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import SwiftUI
import NutriRankDomain

public struct FeedGroupView: View {
    @ObservedObject var viewmodel: FeedGroupViewModel

    public init(viewmodel: FeedGroupViewModel) {
        self.viewmodel = viewmodel
    }

    public var body: some View {
        VStack {
            Button {
                Task {
                    await viewmodel.createGroup()
                }
                print("chegou na view")
            } label: {
                Text("Criar grupo")
            }
        }
    }
}
