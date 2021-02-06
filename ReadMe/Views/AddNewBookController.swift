//
//  AddNewBookController.swift
//  ReadMe
//
//  Created by Thomas Kebschull on 1/31/21.
//

import SwiftUI

struct AddNewBookController: View {
    @ObservedObject var book = Book(title: "", author: "")
    @State var image: UIImage? = nil
    @EnvironmentObject var library: Library
    @Environment(\.presentationMode) var presenatationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 24) {
                TextField("Title", text: $book.title)
                TextField("Author", text: $book.author)
                ReviewAndImagesStack(book: book, image: $image)
            }
            .padding()
            .navigationBarTitle("Got a new book?")
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button("Add to Library") {
                        library.addNewBook(book, image: image)
                        presenatationMode.wrappedValue.dismiss()
                    }
                    .disabled(
                        [book.title, book.author].contains(where: \.isEmpty)
                    )
                }
            }
        }
    }
}

struct AddNewBookController_Previews: PreviewProvider {
    static var previews: some View {
        AddNewBookController().environmentObject(Library())
    }
}
