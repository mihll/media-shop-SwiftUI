//
//  MusicDetails.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI
import CoreMotion

struct MusicDetails: View {
    var musicItem: Music
    @State var flipped = false
    @State private var fadeOut = false
    @State var showSheetView = false
    @State private var showingAlert = false
    @EnvironmentObject var cart: Cart
    var body: some View {
        
        let flipDegrees = flipped ? 180.0 : 0
        
        ScrollView {
            ZStack(){
                musicItem.mainImage
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .scaledToFit()
                    .frame(maxWidth: 400)
                    .padding()
                    .modifier(ParallaxMotionModifier(magnitude: 10))
                    .flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
                musicItem.backImage
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .scaledToFit()
                    .frame(maxWidth: 400)
                    .padding()
                    .modifier(ParallaxMotionModifier(magnitude: 10))
                    .flipRotate(-180 + flipDegrees).opacity(flipped ? 1.0 : 0.0)
            }
            .animation(.easeInOut(duration: 0.25))
            .onTapGesture {
                self.flipped.toggle()
            }
            
            HStack() {
                VStack(alignment: .leading){
                    Text(musicItem.title)
                        .font(.title)
                    Text(musicItem.artist)
                        .font(.title2)
                }
                Spacer()
                HStack(){
                    Button(action: {
                        addItemToCart(itemToAdd: musicItem)
                    }) {
                        Text(String(format: "%.2f zł", musicItem.price))
                            .font(.headline)
                        Image(systemName: "cart.badge.plus").imageScale(.large)
                    }
                }
            }.padding(.horizontal)
            VStack(alignment: .leading){
                if musicItem.description != "" {
                    DescriptionView(descriptionText: musicItem.description)
                }
                if !musicItem.trackList.isEmpty {
                    TrackList(tracks: musicItem.trackList)
                }
                DetailsTable(item: musicItem)
            }.padding([.leading, .bottom, .trailing])
        }.navigationBarTitle(musicItem.title, displayMode: .inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    self.showSheetView.toggle()
                                }){
                                    if cart.items.isEmpty{
                                        Text("Koszyk")
                                        Image(systemName: "cart").imageScale(.large)
                                    } else {
                                        Text("Koszyk (\(cart.items.count))" )
                                        Image(systemName: "cart.fill").imageScale(.large)
                                    }
                                }
        )
        .sheet(isPresented: $showSheetView) {
            CartView(showSheetView: self.$showSheetView)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Ten przedmiot znajduje się już w twoim koszyku!"))
        }
        
    }
    
    func addItemToCart (itemToAdd: Music) {
        if self.cart.items.contains(where: {item in item.id == itemToAdd.id }) {
            self.showingAlert = true
        } else {
            let item = CartItem()
            item.id = musicItem.id
            item.title = musicItem.title
            item.extraText = musicItem.artist
            item.price = musicItem.price
            item.mainImageName = musicItem.mainImageName
            item.amount = 1
            self.cart.items.append(item)
        }
    }
}

extension View {
    func flipRotate(_ degrees : Double) -> some View {
        return rotation3DEffect(Angle(degrees: degrees), axis: (x: 0.0, y: 1.0, z: 0.0))
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
