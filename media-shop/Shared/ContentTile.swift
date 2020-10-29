//
//  ContentTile.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 27/10/2020.
//

import SwiftUI

struct ContentTile: View {
    var extraInfo: String
    var content: Content
    
    var body: some View {
        NavigationLink(destination: getDestination(from: content)) {
            VStack(alignment: .center) {
                content.mainImage
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .scaledToFit()
                    .frame(maxHeight: 200)
                
                HStack() {
                    VStack(alignment: .leading){
                        Text(content.title)
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .lineLimit(1)
                        Text(extraInfo)
                            .font(.subheadline)
                            .foregroundColor(Color.black)
                            .lineLimit(1)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text(content.price + " zł")
                            .foregroundColor(Color.black)
                    }
                }
            }
            .padding([.leading, .bottom])
        }
    }
    
    func getDestination(from navItem: Content) -> AnyView {
        if navItem is Music {
            return AnyView(MusicDetails(musicItem: navItem as! Music))
        } else {
            return AnyView(MusicDetails(musicItem: navItem as! Music))
        }
    }
}

struct ContentTile_Previews: PreviewProvider {
    static var previews: some View {
        ContentTile(extraInfo: musicData[0].artist, content: musicData[0])
    }
}
