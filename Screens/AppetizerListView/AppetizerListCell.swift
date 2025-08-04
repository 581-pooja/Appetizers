//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Pooja4 Bhagat on 29/06/25.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 120, height: 90)
//                .clipped()
//                .cornerRadius(10)
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 90)
                    .clipped()
                    .cornerRadius(10)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 90)
                    .clipped()
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.price, format: .currency(code: "USD"))
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}

/* AppetizerRemoteImage:
 Over here we can cache images for fast loading
 
 AsyncImage: We cannot cache image (good for less images)
 AsyncImage: A view that asynchronously loads and displays an image.
 This view uses the shared URLSession instance to load an image from the specified URL, and then display it.
 It takes a url string of url type & if url not present then it goes in placeholder does not throws any error
 */
