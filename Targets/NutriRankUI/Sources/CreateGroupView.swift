//
//  CreateGroupView.swift
//  NutriRankUI
//
//  Created by Stephane Girão Linhares on 19/09/23.
//  Copyright © 2023 Merendeers. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

public struct CreateGroupView: View {

    public init() {}
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var isImagePickerDisplay2 = false


    public var body: some View {

        GeometryReader { metrics in
            NavigationView {
                VStack {
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Rectangle())
                            .scaledToFill()
                            .frame(width: metrics.size.width * 0.92, height: metrics.size.height * 0.20)
                            .cornerRadius(10)
                            .containerRelativeFrame([.horizontal])
                    } else {
                        Image(systemName: "camera.fill").font(.system(size: 37, weight: .regular))
                            .aspectRatio(contentMode: .fit)
                            .scaledToFill()
                            .frame(width: metrics.size.width * 0.92, height: metrics.size.height * 0.20)
                            .background(.green)
                            .cornerRadius(10)
                    }

                    Button("Editar imagem") {
                        self.isImagePickerDisplay.toggle()
                    }.padding()

                    Spacer()
                }
                .navigationBarTitle("Demo")
                .actionSheet(isPresented: $isImagePickerDisplay) {
                    ActionSheet(
                        title: Text("Escolha uma opção"),
                        buttons:[
                            .default(
                                Text("Câmera"),
                                action: {
                                    self.sourceType = .camera
                                    self.isImagePickerDisplay2 = true
                                }
                            ),
                            .default(
                                Text("Galeria"),
                                action: {
                                    self.sourceType = .photoLibrary
                                    self.isImagePickerDisplay2 = true
                                }
                            ),
                            .cancel()
                        ]
                    )
                }
                .sheet(isPresented: self.$isImagePickerDisplay2) {
                    ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                }

            }

        }
        .navigationViewStyle(.stack)
    }

}


struct CreateGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroupView()
    }
}
