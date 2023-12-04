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
    
    let genres = ["Fantasy", "Self Improvement", "Science Fiction", "Code", "Romance"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextFieldWithIcon(placeholder: "Book Title", text: $title, systemImageName: "book")
                TextFieldWithIcon(placeholder: "Author", text: $author, systemImageName: "person")
                
                // Status Picker
                Picker("Status", selection: $selectedStatus) {
                    ForEach(BookStatus.allCases, id: \.self) { status in
                        Text(status.rawValue).tag(status)
                    }
                }
                .pickerStyle(.segmented)
                
                // Genre Selection
                Text("Select Genre")
                    .font(.headline)
                GenreSelectionGrid(genres: genres, selectedGenre: $selectedGenre)
                
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
            .navigationTitle("Add Book")
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
        newBook.genre = selectedGenre
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
