//
//  SingleCardView.swift
//  ScavengerHuntApp
//
//  Created by Din Salehy on 2025-02-06.
//
import SwiftUI

struct SingleCardView: View {
    let card: Card  // This view takes a Card instance
  
    // Function to load all images and descriptions for each folder
  func getImagesFromFolder(folderName: String) -> ([String], String) {
        let imageData: [String: ([String], String)] = [
            "Animal": (["Animal-1", "Animal-2", "Animal-3"],
                       "This collection showcases a diverse range of animals, each captured in their natural habitat, from playful dolphins to majestic elephants. The vibrant images in this collection highlight the beauty and uniqueness of wildlife, featuring animals from lush rainforests to arid deserts."),
            
            "Birds": (["Bird-1", "Bird-2", "Bird-3"],
                      "The birds in this collection represent the beauty and variety of avian species. From the elegance of soaring eagles to the playfulness of small sparrows, each image captures the spirit of flight."),
            
            "Snakes": (["Snake-1", "Snake-2", "Snake-3"],
                       "This collection features an array of snake species, captured in their natural environments, showcasing their elegance and mystery. From the slithering movements of cobras to the striking patterns of boas, this collection celebrates the fascinating world of snakes. Each image in this collection highlights the adaptability and beauty of snakes, emphasizing their role in various ecosystems."),
            
            "Nature": (["Nature-1", "Nature-2", "Nature-3"],
                       "This collection encapsulates the breathtaking beauty of nature, from towering mountains to serene lakes and lush forests. Each image reflects the power and tranquility of the natural world, offering a glimpse into Earth's diverse landscapes. The Nature Image Collection transports you to the heart of the wilderness, where every scene is a testament to nature's awe-inspiring beauty."),
            
            "Dolphine": (["Dolphine-1", "Dolphine-2", "Dolphine-3"],
                        "The Dolphin Image Collection offers a glimpse into the playful and intelligent nature of dolphins, with stunning underwater shots and graceful movements. These images capture dolphins in their natural habitat, swimming together in pods and performing acrobatic leaps through the water. With their friendly demeanor and sleek bodies, dolphins are celebrated in this collection, showcasing their intelligence and beauty."),
            
            "Shark": (["Shark-1", "Shark-2", "Shark-3"],
                      "This collection highlights the power and mystery of sharks, showcasing these magnificent creatures in their deep-sea habitats. From the menacing teeth of a great white to the elegance of a hammerhead, this collection offers a look into the world of sharks. Sharks, often misunderstood, are shown in their true form, revealing the beauty and grace that lies beneath the surface."),
            
            "Horses": (["Horse-1", "Horse-2", "Horse-3"],
                       "This collection features stunning images of horses, capturing their beauty, strength, and grace. From galloping across open fields to standing majestically in stables, these images showcase the nobility of horses."),
            
            "Fish": (["Fish-1", "Fish-2", "Fish-3"],
                     "This collection captures the beauty of underwater life, featuring vibrant fish swimming in coral reefs. Each image reveals the vibrant colors and intricate patterns of different fish species in their natural habitat."),
            
            "Crocodiles": (["Crocodile-1", "Crocodile-2", "Crocodile-3"],
                          "The Crocodile Image Collection offers a closer look at these formidable reptiles, highlighting their powerful jaws and stealthy movements. Captured in both their natural habitats and moments of stillness, these images showcase the fierce beauty of crocodiles. From lurking in murky waters to basking in the sun, this collection reveals the adaptability and resilience of crocodiles."),
            
            "Cats": (["Cat-1", "Cat-2", "Cat-3"],
                             "The Cats Image Collection highlights the elegance and charm of domestic and wild cats. From playful kittens to majestic big cats like lions and tigers, each image captures the personality and beauty of felines in various settings. Whether lounging in the sun or stalking in the wild, these images showcase the mystery and grace of cats.")
        ]
        
        return imageData[folderName] ?? ([], "")  // Return images and description for the folder or empty if not found
    }

    
    
    @State private var dragAmounts: [CGSize] = Array(repeating: .zero, count: 10) // Array for drag state
    @State private var rotations: [Angle] = Array(repeating: .zero, count: 10)  // Array for rotation state
    @State private var scales: [CGFloat] = Array(repeating: 1.0, count: 10)     // Array for scale state
    
    // Function to apply gestures
    func applyGestures(for index: Int) -> some Gesture {
        return SimultaneousGesture(
            DragGesture()
                .onChanged { value in
                    dragAmounts[index] = value.translation
                }
                .onEnded { _ in
                    dragAmounts[index] = .zero
                },
            
            RotationGesture()
                .onChanged { angle in
                    rotations[index] = angle
                }
        )
    }
    
    var body: some View {
        ScrollView {
            VStack {  // Display images with spacing
                let (images, description) = getImagesFromFolder(folderName: card.folderName)
                
                // Display all images for the folder
                ForEach(images.indices, id: \.self) { index in
                    VStack {
                        // Image with drag, rotation, and magnification gestures
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .cornerRadius(15)  // Optional: To round the corners of images
                            .padding(.bottom, -80)
                            .offset(dragAmounts[index])  // Apply the drag offset for this image
                            .rotationEffect(rotations[index])  // Apply the rotation for this image
                            .scaleEffect(scales[index])  // Apply the scale (zoom) for this image
                            .gesture(applyGestures(for: index))  // Apply gestures for this image
                    }
                }
                
                // Display detailed description specific to the folder
                if !description.isEmpty {
                    Text(description)
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 15)
                        // Add conditional padding for Horses and Fish
                        .padding(.top, card.folderName == "Horses" ? 10 : 0)  // Padding for "Horses"
                        .padding(.top, card.folderName == "Fish" ? 10 : 0)   // Padding for "Fish"
                }
                
                Text("-------------------------")  // Decorative separator
            }
        }
        .navigationTitle(card.title)  // Show the card title in the navigation bar
    }
}

// Preview to test the CardsListView
struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
    }
}
