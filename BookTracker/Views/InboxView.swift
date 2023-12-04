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
    @State private var showingAddBookView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    BookDetail(title: book.title ?? "", author: book.author ?? "")
                }
                .onDelete(perform: deleteBook)
            }
            .navigationTitle("Inbox")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddBookView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddBookView) {
                AddBookView()
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
    func deleteBook(at offsets: IndexSet) {
        for index in offsets {
            let book = books[index]
            managedObjContext.delete(book)
        }
        
        do {
            try managedObjContext.save()
        } catch {
            print("Error deleting book: \(error)")
        }
    }
}


#Preview {
    InboxView()
}
