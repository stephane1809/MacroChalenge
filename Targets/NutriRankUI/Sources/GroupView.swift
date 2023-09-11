//
//  GroupView.swift
//  NutriRankKit
//
//  Created by Paulo Henrique Gomes da Silva on 04/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import SwiftUI

public struct GroupView: View {

    @StateObject var viewmodel = GroupsViewModel()
    @State var showingSheet = false

    public init() { }

    public var body: some View {
        NavigationStack {
            VStack {
                List(viewmodel.groups) { group in
                    Text(group.name)
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add group") {
                        showingSheet.toggle()
                    }.sheet(isPresented: $showingSheet) {
                        VStack {
                            Text("Create a new group")
                                .font(.largeTitle)
                            Button("Criar grupo") {
                                viewmodel.createGroup(users: UserNutri.users, groupName: "Teste")
                                print(viewmodel.groups.count)
                                showingSheet.toggle()
                            }
                        }.padding()
                    }
                }
            }
            .navigationTitle("Lista de grupos")
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
