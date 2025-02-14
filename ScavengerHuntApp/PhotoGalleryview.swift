//
//  PhotoGalleryview.swift
//  ScavengerHuntApp
//
//  Created by Din Salehy on 2025-02-13.
//

import SwiftUI

struct PhotoGalleryView: View {
    @Binding var selectedImage: UIImage? // Binding to ContentView's selectedImage
    @Environment(\.dismiss) var dismiss // To close the gallery after selection

    @State private var imageNames: [String] = [
        "Animal-1", "Animal-2", "Animal-3",
        "Bird-1", "Bird-2", "Bird-3",
        "Snake-1", "Snake-2", "Snake-3",
        "Nature-1", "Nature-2", "Nature-3",
        "Dolphine-1", "Dolphine-2", "Dolphine-3",
        "Shark-1", "Shark-2", "Shark-3",
        "Horse-1", "Horse-2", "Horse-3",
        "Fish-1", "Fish-2", "Fish-3",
        "Crocodile-1", "Crocodile-2", "Crocodile-3",
        "Cat-1", "Cat-2", "Cat-3"
    ]

    var body: some View {
        NavigationView {
            VStack {
                if imageNames.isEmpty {
                    Text("No images available")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                            ForEach(imageNames, id: \.self) { imageName in
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .onTapGesture {
                                        if let uiImage = UIImage(named: imageName) {
                                            print("Image tapped: \(imageName)")  // Debugging print
                                            selectedImage = uiImage  // Update selectedImage in ContentView
                                            dismiss() // Close the gallery after selection
                                        } else {
                                            print("Failed to load image: \(imageName)") // Debugging for missing assets
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Photo Gallery")
        }
    }
}

#Preview {
  //  PhotoGalleryView()
}

