//
//  ReviewandImagesStack.swift
//  ReadMe
//
//  Created by Thomas Kebschull on 1/31/21.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct ReviewAndImagesStack: View {
    @State var showingImagePicker = false
    @State var showingDeleteImageAlert = false
    @ObservedObject var book: Book
    @Binding var image: UIImage?
    
    var body: some View {
        VStack{
            Divider()
                .padding(.vertical)
            TextField("Review...", text: $book.microReview)
            Divider()
                .padding(.vertical)
            
            VStack {
                Book.Image(
                    uiImage: image,
                    title: book.title,
                    cornerRadius: 16
                )
                .scaledToFit()
                
                let updateButton =
                    Button("Update Image...") {
                        showingImagePicker = true
                    }
                    .padding()
                
                if image != nil {
                    HStack {
                        Spacer()
                        
                        Button("Delete Image") {
                            showingDeleteImageAlert = true
                        }
                        
                        Spacer()
                        
                        updateButton
                        
                        Spacer()
                    }
                }
                else {
                    updateButton
                }
            }
            
            Spacer()
            
        }
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
        }
        .alert(isPresented: $showingDeleteImageAlert) {
            .init(
                title: .init("Delete image for \(book.title)?"), primaryButton: .destructive(.init("Delete")) {
                    image = nil
                }, secondaryButton: .cancel()
            )
    }
}
}


struct ReviewAndImagesStack_Previews: PreviewProvider {
    static var previews: some View {
        ReviewAndImagesStack(book: .init(), image: .constant(nil))
            .padding(.horizontal)
            .previewedInAllColorSchemes
    }
}
