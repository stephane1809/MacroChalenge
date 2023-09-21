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
                    await viewmodel.fetchGroup()
                    print(viewmodel.groups.count)
                }
//                print("\(viewmodel.groups.first)")
            } label: {
                Text("Criar grupo")
            }

            Button {
                Task {
                    for group in viewmodel.groups {
                        print(group)
                        await viewmodel.deleteGroup(group:group)
                    }
                }
//                let groupToDelete = viewmodel.groupxs[0]
//                print(groupToDelete)

//                print("\(viewmodel.groups)")
            } label: {
                Text("deletar grupo")
            }
        }
    }
}
