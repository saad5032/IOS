//
//  BookRow.swift
//  Books
//
//  Created by Kurt McMahon on 11/2/23.
//

import SwiftUI

struct BookRow: View {
    
    let book: Book
    
    var body: some View {
        HStack(alignment: .top) {
            Image(uiImage: book.showCover)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 100)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(book.showTitle)
                    .font(.title3)
                    .bold()
                Text(book.showAuthor)
                    .foregroundColor((book.author != nil) ? .black : .gray)
                Text(book.showYear)
                    .font(.caption)
            }
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    
    static let viewContext = PersistenceController.preview.container.viewContext
    
    static var book: Book {
        let book = Book(context: viewContext)
        book.title = "A Book"
        book.author = nil
        book.year = 2023
        book.cover = nil
        
        return book
    }
    
    static var previews: some View {
        BookRow(book: book)
    }
}
