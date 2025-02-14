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

import SwiftUI

struct CardsListView: View {
    let cards: [Card] = [
        Card(backgroundColor: .red, title: "Animal", folderName: "Animal"),
        Card(backgroundColor: .blue, title: "Birds", folderName: "Birds"),
        Card(backgroundColor: .green, title: "Snakes", folderName: "Snakes"),
        Card(backgroundColor: .yellow, title: "Nature", folderName: "Nature"),
        Card(backgroundColor: .purple, title: "Dolphine", folderName: "Dolphine"),
        Card(backgroundColor: .orange, title: "Shark", folderName: "Shark"),
        Card(backgroundColor: .blue, title: "Horses", folderName: "Horses"),
        Card(backgroundColor: .green, title: "Fish", folderName: "Fish"),
        Card(backgroundColor: .yellow, title: "Cats", folderName: "Cats"),
        Card(backgroundColor: .red, title: "Crocodiles", folderName: "Crocodiles")
    ]

    @State private var selectedCard: Card?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(cards) { card in
                    CardThambNail(card: card)
                        .onTapGesture {
                            selectedCard = card
                        }
                }
            }
            .padding()
        }
        .fullScreenCover(item: $selectedCard) { card in
            SingleCardView(card: card)
        }
    }
}

#Preview {
    CardsListView()
}
