//
//  MusicListRow.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 04/11/2020.
//

import SwiftUI

struct MusicListRow: View {
    var musicItem: Music
    var body: some View {
        NavigationLink(destination: MusicDetails(musicItem: musicItem)){
            HStack() {
                musicItem.mainImage
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .scaledToFit()
                    .frame(maxHeight: 75)
                VStack(alignment: .leading){
                    Text(musicItem.title)
                        .font(.headline)
                    Text(musicItem.artist)
                        .font(.subheadline)
                }
                Spacer()
                VStack(){
                    Text(String(format: "%.2f zł", musicItem.price))
                }
                .padding(.leading)
            }
        }
    }
}

struct MusicListRow_Previews: PreviewProvider {
    static var previews: some View {
        MusicListRow(musicItem: musicData[0])
    }
}
