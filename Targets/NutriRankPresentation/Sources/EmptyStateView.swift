//
//  EmptyStateView.swift
//  NutriRankPresentation
//
//  Created by Stephane Girão Linhares on 03/10/23.
//  Copyright © 2023 com.merendeers. All rights reserved.
//

import Foundation
import SwiftUI

public struct EmptyStateView: View {

    public init() {}

    public var body: some View {
        GeometryReader { metrics in
            NavigationView {
                VStack (spacing: 110) {
                    VStack {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Rectangle())
                            .scaledToFill()
                            .frame(width: metrics.size.width * 0.6, height: metrics.size.height * 0.25)
                    }
                    HStack {
                        Image(systemName: "person.crop.circle.fill.badge.plus").font(.system(size: 18, weight: .regular))
                            .aspectRatio(contentMode: .fit)
                            .scaledToFill()

                        Text ("Criar grupo")

                    }

                    VStack {
                        Button {

                        } label: {
                            HStack (alignment: .center){
                                Image(systemName: "person.crop.circle.fill.badge.plus")
                                    .foregroundColor(.white)

                                Text("Criar grupo")
                                    .font(.headline)

                                    .foregroundColor(.white)
                            }
                            .frame(width: 150, height: 35)
                        }
                        .background(Color("Red"))
                        .cornerRadius(10)
                        .buttonStyle(.bordered)
                    }
                }

            }
        }
    }
}
