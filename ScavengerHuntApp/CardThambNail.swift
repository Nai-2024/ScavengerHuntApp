//
//  ThumbNailView.swift
//  ScavengerHuntApp
//
//  Created by Din Salehy on 2025-02-13.
//

import SwiftUI

struct CardThambNail: View {
    let card: Card

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(card.backgroundColor)
                .frame(width: 150, height: 200)
                .overlay(
                    Text(card.title)
                        .foregroundColor(.white)
                        .font(.headline)
                        .bold()
                )
        }
    }
}


#Preview {
    //CardThambNail()
}
