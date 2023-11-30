//
//  BookDetail.swift
//  BookTracker
//
//  Created by ivan trj  on 30.11.23.
//

import SwiftUI

struct BookDetail: View {
    var title: String
    var author: String

    var body: some View {
        HStack(spacing: 15) {
            // Icon or Image for the book
            Image(systemName: "book.closed")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)

            // Book Details
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary) // Adapts to dark/light mode
                    .lineLimit(1) // Ensures the title fits in a single line

                Text(author)
                    .font(.subheadline)
                    .foregroundColor(.secondary) // A slightly subdued color
                    .lineLimit(1) // Fit the author's name in a single line
            }

            Spacer() // Pushes everything to the left
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
        .background(Color(.systemBackground)) // Adapts to dark/light mode
        .cornerRadius(10)
        .shadow(color: Color(.systemGray4), radius: 5, x: 0, y: 2)
        .padding(.horizontal, 10) // Additional padding for the list item
    }
}



#Preview {
    BookDetail(title: "Lord of the Rings", author: "J.R.R. Tolkien")
}
