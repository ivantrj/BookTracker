//
//  BooksView.swift
//  BookTracker
//
//  Created by ivan trj  on 30.11.23.
//

import SwiftUI

struct BooksView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.date, order: .reverse)],
        predicate: NSPredicate(format: "isInInbox == false AND status != nil")
    )
    var books: FetchedResults<Book>
    
    @State private var selectedStatus: BookStatus = .wantToRead
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Status", selection: $selectedStatus) {
                    ForEach(BookStatus.allCases, id: \.self) { status in
                        Text(status.rawValue).tag(status)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                List {
                    ForEach(books.filter { $0.status == selectedStatus.rawValue }) { book in
                        BookDetail(title: book.title ?? "", author: book.author ?? "")
                    }
                }
            }
            .navigationTitle("Books")
        }
    }
}


#Preview {
    BooksView()
}
