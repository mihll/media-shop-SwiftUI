//
//  MusicCarousel.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 29/10/2020.
//

import SwiftUI

struct MusicCarousel: View {
    var carouselTitle: String
    var carouselData: [Music]
    
    var body: some View {
        VStack(){
            NavigationLink(destination: ContentList()){
                HStack() {
                    Text(carouselTitle)
                        .font(.title)
                        .padding(.leading)
                    Image(systemName: "chevron.right")
                        .imageScale(.large)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            ScrollView(.horizontal) {
                HStack() {
                    ForEach(carouselData) { music in
                        ContentTile(extraInfo: music.artist, content: music)
                    }
                }
            }
        }
    }
}

struct MusicCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MusicCarousel(carouselTitle: "Test", carouselData: musicData)
    }
}
