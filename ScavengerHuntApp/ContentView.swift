//
//  ContentView.swift
//  ScavengerHuntApp
//
//  Created by Din Salehy on 2025-02-06.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedImage: UIImage? = nil
    @State private var showCamera = false
    @State private var showGallery = false // To trigger showing the gallery

    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .id(UUID())  // Force view update when image changes
                
                Button("Remove Photo") {
                    selectedImage = nil
                }
                .foregroundColor(.red)
                .padding()
            } else {
                Text("No Image Selected")
                    .foregroundColor(.gray)
            }
            
            HStack {
                Button("Select from Gallery") {
                    showGallery = true // Open gallery
                }
                .padding()
                .buttonStyle(.bordered)
                
                Button("Take a Photo") {
                    showCamera = true
                }
                .padding()
                .buttonStyle(.borderedProminent)
            }
        }
        .sheet(isPresented: $showGallery) {
            PhotoGalleryView(selectedImage: $selectedImage) // Pass binding
        }
        .onChange(of: selectedImage) { newValue in
            print("selectedImage updated: \(String(describing: newValue))")  // Debugging print
        }
    }
}

#Preview {
    ContentView()
}
