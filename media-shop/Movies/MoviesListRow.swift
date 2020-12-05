//
//  MoviesListRow.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 18/11/2020.
//

import SwiftUI

struct MoviesListRow: View {
    var movieItem: Movie
    var body: some View {
        NavigationLink(destination: MovieDetails(movieItem: movieItem)){
            HStack() {
                HStack(){
                    movieItem.mainImage
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        .scaledToFill()
                        .frame(width: 70, height: 100)
                    VStack(alignment: .leading){
                        Text(movieItem.title)
                            .font(.headline)
                        Text(movieItem.director)
                            .font(.subheadline)
                        Spacer()
                        Text(movieItem.storageMedia)
                            .font(.subheadline)
                    }
                }.frame(maxHeight: 100)
                Spacer()
                VStack(){
                    Text(String(format: "%.2f zł", movieItem.price))
                }
                .padding(.leading)
            }
        }
    }
}

struct MoviesListRow_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListRow(movieItem: movieData[1])
    }
}
