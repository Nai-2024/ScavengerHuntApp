//
//  CardsListView.swift
//  ScavengerHuntApp
//
//  Created by Din Salehy on 2025-02-06.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()  // Unique identifier for each card
    var backgroundColor: Color  // Each card has a different background color
    var title: String  // Title for each card (for display)
    var folderName: String  // Folder name for the images
}

struct CardsListView: View {
  
    // Create a list of cards with folder names
    let cards: [Card] = [
        Card(backgroundColor: .red, title: "Animal", folderName: "Animal"),        // "Animal" folder
        Card(backgroundColor: .blue, title: "Birds", folderName: "Birds"),          // "Birds" folder
        Card(backgroundColor: .green, title: "Snakes", folderName: "Snakes"),       // "Snakes" folder
        Card(backgroundColor: .yellow, title: "Nature", folderName: "Nature"),     // "Nature" folder
        Card(backgroundColor: .purple, title: "Dolphine", folderName: "Dolphine"),    // "Dolphin" folder
        Card(backgroundColor: .orange, title: "Shark", folderName: "Shark"),        // "Shark" folder
        Card(backgroundColor: .blue, title: "Horses", folderName: "Horses"),        // "Horses" folder
        Card(backgroundColor: .green, title: "Fish", folderName: "Fish"),          // "Fish" folder
        Card(backgroundColor: .yellow, title: "Cats", folderName: "Cats"),
        Card(backgroundColor: .red, title: "Crocodiles", folderName: "Crocodiles"), // "Crocodiles" folder
    ]
  
    @State private var selectedCard: Card?  // Track which card is selected

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(cards) { card in
                    CardThumbnail(card: card)
                        .onTapGesture {
                            selectedCard = card
                        }
                }
            }
        }
        .fullScreenCover(item: $selectedCard) { card in
            // Show selected card in full screen with all images from the folder
            SingleCardView(card: card)
        }
    }
}

#Preview {
    CardsListView()
}
