//
//  DetailView.swift
//  ReadMe
//
//  Created by Thomas Kebschull on 1/25/21.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var book: Book
    @EnvironmentObject var library: Library
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                BookmarkButton(book: book)
                AuthorandTitleStack(
                    book: book,
                    titleFont: .title,
                    authorFont: .title2
                )
            }
            ReviewAndImagesStack(book: book, image: $library.uiImages[book])
        }
        .padding()
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init())
            .environmentObject(Library())
            .previewedInAllColorSchemes
    }
}
