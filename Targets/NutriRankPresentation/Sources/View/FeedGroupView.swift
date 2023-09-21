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

    @State var isPresented: Bool = false

    public init(viewmodel: FeedGroupViewModel) {
        self.viewmodel = viewmodel
    }

    public var body: some View {
        VStack {
            if viewmodel.groups.isEmpty {
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Criar grupo")
                }.buttonStyle(.borderedProminent)
                    .sheet(isPresented: $isPresented) {
                        CreateGroupView(viewModel: viewmodel)
                    }
            } else {
                List(viewmodel.groups) { group in
                    NavigationLink(destination: GroupView(viewmodel: viewmodel)) {
                        Text(group.groupName)
                    }
                }
            }
        }
    }
}

struct GroupView: View {
    
    @ObservedObject var viewmodel: FeedGroupViewModel

    @State var title: String = ""
    @State var description: String = ""

    init(viewmodel: FeedGroupViewModel) {
        self.viewmodel = viewmodel
    }

    var body: some View {
        if viewmodel.posts.isEmpty {
            Button {
                Task {
                    await viewmodel.createPost(title: title, description: description)
                }
            } label: {
                Text("Criar post")
            }
        } else {
            List(viewmodel.posts) { post in
                Text(post.title)
                Text(post.description)
            }
        }
    }
}



struct CreateGroupView: View {
    @Environment(\.dismiss) var dismiss

    @ObservedObject var viewModel: FeedGroupViewModel

    @State var groupName: String = ""
    @State var description: String = ""

    init(viewModel: FeedGroupViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        TextField("Nome do grupo", text: $groupName)
        TextField("Descrição do grupo", text: $description)
        Button {
            Task {
                await viewModel.createGroup(groupName: groupName, description: description)
            }
            dismiss()
        } label: {
            Text("Criar o grupo")
        }.buttonStyle(.borderedProminent)
    }
}
