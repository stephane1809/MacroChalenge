//
//  FakeDoorView.swift
//  NutriRankUI
//
//  Created by Paulo Henrique Gomes da Silva on 04/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import SwiftUI

public struct FakeDoorView: View {

    @Environment(\.openURL) var openURL

    public init() {}

    public var body: some View {
        VStack(spacing: 10) {
            Text("😢😢")
            Text("Infelizmente o aplicativo ainda não está pronto!")
            Text("Clique no botão abaixo para que esteja por dentro de novidades da empresa!")
            Button {
                openURL(URL(string: "https://boramerendar.wixsite.com/bora-merendar")!)
            } label: {
                Text("Página Inicial")
            }
                .buttonStyle(.borderedProminent)
        }
            .padding()
    }
}

struct FakeDoorView_Previews: PreviewProvider {
    static var previews: some View {
        FakeDoorView()
    }
}
