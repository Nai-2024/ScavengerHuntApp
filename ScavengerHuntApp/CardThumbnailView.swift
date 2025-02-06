//
//  CardThumbnailView.swift
//  ScavengerHuntApp
//
//  Created by Din Salehy on 2025-02-06.
//

import SwiftUI

// Define a thumbnail view for displaying cards
struct CardThumbnail: View {
    let card: Card  // Each CardThumbnail receives a Card instance
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(card.backgroundColor)  // Use the card's background color
            .frame(width: 150, height: 260)  // Set a fixed size
            .overlay(
                Text(card.title)  // Display the card's title
                    .foregroundColor(.white)
                    .font(.headline)
            )
    }
}

// Preview of a single CardThumbnail
#Preview {
    CardThumbnail(card: Card(backgroundColor: .green, title: "Sample Card", folderName: "Animal"))
}
