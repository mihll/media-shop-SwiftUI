//
//  BooksListRow.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 05/12/2020.
//

import SwiftUI

struct BooksListRow: View {
    var bookItem: Book
    var body: some View {
        NavigationLink(destination: BookDetails(bookItem: bookItem)){
            HStack() {
                HStack(){
                    bookItem.mainImage
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        .scaledToFill()
                        .frame(width: 70, height: 100)
                    VStack(alignment: .leading){
                        Text(bookItem.title)
                            .font(.headline)
                        Text(bookItem.author)
                            .font(.subheadline)
                    }
                }.frame(maxHeight: 100)
                Spacer()
                VStack(){
                    Text(String(format: "%.2f zł", bookItem.price))
                }
                .padding(.leading)
            }
        }
    }
}

struct BooksListRow_Previews: PreviewProvider {
    static var previews: some View {
        BooksListRow(bookItem: bookData[0])
    }
}
