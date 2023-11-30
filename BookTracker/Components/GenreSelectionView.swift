//
//  GenreSelectionView.swift
//  BookTracker
//
//  Created by ivan trj  on 30.11.23.
//

import SwiftUI

struct GenreSelectionGrid: View {
    let genres: [String]
    @Binding var selectedGenre: String?

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 10)], spacing: 10) {
            ForEach(genres, id: \.self) { genre in
                GenreButton(genre: genre, isSelected: selectedGenre == genre) {
                    selectedGenre = genre
                }
            }
        }
    }
}

struct GenreButton: View {
    let genre: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(genre)
                .fontWeight(isSelected ? .bold : .regular)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color.blue : Color(.systemGray5))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(8)
        }
    }
}


//
//#Preview {
//    GenreSelectionView()
//}
