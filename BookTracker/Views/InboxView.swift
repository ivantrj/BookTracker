//
//  InboxView.swift
//  BookTracker
//
//  Created by ivan trj  on 30.11.23.
//

import SwiftUI

struct InboxView: View {
    @AppStorage("darkMode") var isDarkMode = false
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var books: FetchedResults<Book>

    @State private var showingAddBookView = false // State to control the presentation of the add book view

    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack {
                            ForEach(books) { book in
                                BookDetail(title: book.title ?? "", author: book.author ?? "")
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle("Inbox")
                .preferredColorScheme(isDarkMode ? .dark : .light)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        showingAddBookView = true
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    .padding()
                    .sheet(isPresented: $showingAddBookView) {
                        AddBookView()
                    }
                }
            }
        }
    }
}


#Preview {
    InboxView()
}
