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
        HStack {
            Image(systemName: "book")
                .foregroundColor(.blue)
                .padding(.trailing, 10)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
    }
}




#Preview {
    BookDetail(title: "Lord of the Rings", author: "J.R.R. Tolkien")
}
