//
//  AddBookView.swift
//  BookTracker
//
//  Created by ivan trj  on 30.11.23.
//

import SwiftUI

struct AddBookView: View {
    @AppStorage("darkMode") var isDarkMode = false
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var isBookAdded = false
    @State private var selectedGenre: String? = nil
    @State private var selectedStatus: BookStatus = .wantToRead
    @State private var selectedGenreIndex: Int = 0
    
    let genres = ["Fantasy", "Self Improvement", "Science Fiction", "Code", "Romance"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                TextFieldWithIcon(placeholder: "Book Title", text: $title, systemImageName: "book")
                
                // Status Picker
                Picker("Status", selection: $selectedStatus) {
                    ForEach(BookStatus.allCases, id: \.self) { status in
                        Text(status.rawValue).tag(status)
                    }
                }
                .pickerStyle(.segmented)
                
                // Genre Picker
                Picker("Genre", selection: $selectedGenreIndex) {
                    ForEach(0 ..< genres.count, id: \.self) {
                        Text(self.genres[$0])
                    }
                }
                
                Button("Add Book") {
                    addBook()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Add Book", displayMode: .inline)
            .alert("Book Added!", isPresented: $isBookAdded) {
                Button("OK") {
                    resetForm()
                }
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
    
    func addBook() {
        let newBook = Book(context: managedObjContext)
        newBook.title = title
        newBook.author = author
        newBook.genre = genres[selectedGenreIndex]
        newBook.date = Date()
        newBook.id = UUID()
        newBook.status = selectedStatus.rawValue
        
        do {
            try managedObjContext.save()
            isBookAdded = true
        } catch {
            print("Error saving the book: \(error)")
        }
    }
    
    func resetForm() {
        title = ""
        author = ""
        selectedGenre = nil
        
        dismiss()
    }
}


#Preview {
    AddBookView()
}
