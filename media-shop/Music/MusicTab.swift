//
//  MusicTab.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct MusicTab: View {
    var body: some View {
        NavigationView {
            VStack() {
                NavigationLink(destination: NewMusic()){
                    HStack() {
                        Text("Nowe")
                            .font(.title)
                            .padding(.leading)
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                ScrollView(.horizontal) {
                    HStack() {
                        ForEach(musicData) { music in
                            NavigationLink(destination: MusicDetails()) {
                                VStack(alignment: .leading) {
                                    music.cover
                                        .resizable()
                                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                        .scaledToFill()
                                    HStack() {
                                        VStack(alignment: .leading){
                                            Text(music.albumTitle)
                                                .font(.headline)
                                                .foregroundColor(Color.black)
                                                .lineLimit(1)
                                            Text(music.artist)
                                                .font(.subheadline)
                                                .foregroundColor(Color.black)
                                        }
                                        Spacer()
                                        VStack(alignment: .leading){
                                            Text(music.price + " zł")
                                                .foregroundColor(Color.black)
                                        }
                                    }
                                    .padding(.bottom)
                                }
                                .padding([.leading, .bottom])
                            }
                        }
                    }
                }
                NavigationLink(destination: BestMusic()){
                    HStack() {
                        Text("Bestsellery")
                            .font(.title)
                            .padding(.leading)
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                ScrollView(.horizontal) {
                    HStack() {
                        ForEach(bestMusicData) { music in
                            NavigationLink(destination: MusicDetails()) {
                                VStack(alignment: .leading) {
                                    music.cover
                                        .resizable()
                                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                        .scaledToFill()
                                    HStack() {
                                        VStack(alignment: .leading){
                                            Text(music.albumTitle)
                                                .font(.headline)
                                                .foregroundColor(Color.black)
                                                .lineLimit(1)
                                            Text(music.artist)
                                                .font(.subheadline)
                                                .foregroundColor(Color.black)
                                        }
                                        Spacer()
                                        VStack(alignment: .leading){
                                            Text(music.price + " zł")
                                                .foregroundColor(Color.black)
                                        }
                                    }
                                    .padding(.bottom)
                                }
                                .padding([.leading, .bottom])
                            }
                        }
                    }
                }
            }.navigationBarTitle("Muzyka")
            .navigationBarItems(trailing:
                                    NavigationLink(destination: CartView()){
                                            Text("Koszyk")
                                            Image(systemName: "cart").imageScale(.large)
                                    }
            )
        }
    }
}

struct MusicTab_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 12","iPad Air (4th generation)"], id: \.self) { deviceName in
            MusicTab()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
