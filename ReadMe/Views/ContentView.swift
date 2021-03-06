//
//  ContentView.swift
//  ReadMe
//
//  Created by Thomas Kebschull on 1/17/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var library: Library
    @State var showingAddNewBook = false
    
    var body: some View {
        NavigationView{
            List {
                Button {
                    showingAddNewBook = true
                }
                    label: {
                        Spacer()
                        
                        VStack {
                            Image(systemName: "book.circle")
                                .font(.system(size: 60))
                            Text("Add New Book")
                                .font(.title2)
                        }
                        
                        Spacer()
                }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(.vertical, 8)
                    .sheet(
                        isPresented: $showingAddNewBook,
                        content: AddNewBookController.init
                    )
                
                ForEach(library.sortedBooks) { book in
                    BookRow(book: book)}
            }
            .navigationBarTitle("My Library")
        }
    }
}

struct BookRow: View {
    @ObservedObject var book: Book
    @EnvironmentObject var library: Library
    
    var body: some View {
        NavigationLink(
            destination:
                DetailView(book: book)
            ) {
            HStack {
                Book.Image(
                    uiImage: library.uiImages[book],
                    title: book.title,
                    size: 80,
                    cornerRadius: 12)
                
                VStack(alignment: .leading) {
                    AuthorandTitleStack(
                        book: book,
                        titleFont: .title2,
                        authorFont: .title3
                    )
                    
                    if !book.microReview.isEmpty {
                        
                        Spacer()
                        Text(book.microReview)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .lineLimit(1)
                
                Spacer()
                
                BookmarkButton(book: book)
                    .buttonStyle(BorderlessButtonStyle())
            }
            .padding(.vertical, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Library())
            .previewedInAllColorSchemes
    }
}






