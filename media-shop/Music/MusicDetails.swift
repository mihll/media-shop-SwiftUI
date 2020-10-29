//
//  MusicDetails.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct MusicDetails: View {
    var musicItem: Music
    @State private var isExpanded: Bool = false
    
    var body: some View {
        ScrollView {
            musicItem.mainImage
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .scaledToFit()
                .padding()
            HStack() {
                VStack(alignment: .leading){
                    Text(musicItem.title)
                        .font(.title)
                    Text(musicItem.artist)
                        .font(.title2)
                }
                Spacer()
                HStack(){
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        Text(musicItem.price + " zł")
                            .font(.headline)
                        Image(systemName: "cart.badge.plus").imageScale(.large)
                    }
                }
            }.padding(.horizontal)
            VStack(alignment: .leading){
                if musicItem.description != "" {
                    Text("Opis")
                        .font(.title)
                        .padding(.top)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(musicItem.description)
                        .animation(.easeInOut)
                        .lineLimit(isExpanded ? nil : 3)
                        .overlay(
                            GeometryReader { proxy in
                                Button(action: {
                                    isExpanded.toggle()
                                }) {
                                    Text(isExpanded ? "...mniej" : "...więcej")
                                        .font(.caption).bold()
                                        .padding(.leading, 8.0)
                                        .padding(.top, 4.0)
                                        .background(Color.white)
                                }
                                .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                            }
                        )
                }
                TrackList(tracks: musicItem.trackList)
                
            }.padding([.leading, .bottom, .trailing])
        }.navigationBarTitle(musicItem.title, displayMode: .inline)
        .navigationBarItems(trailing:
                                NavigationLink(destination: CartView()){
                                    Text("Koszyk")
                                    Image(systemName: "cart").imageScale(.large)
                                }
        )
    }
}

struct MusicDetails_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (1st generation)","iPhone 12","iPad Air (4th generation)"], id: \.self) { deviceName in
            MusicDetails(musicItem: musicData[0])
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
