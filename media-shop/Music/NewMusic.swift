//
//  NewMusic.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 22/10/2020.
//

import SwiftUI

struct NewMusic: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarTitle("Nowe")
            .navigationBarItems(trailing:
                                    NavigationLink(destination: CartView()){
                                            Text("Koszyk")
                                            Image(systemName: "cart").imageScale(.large)
                                    }
            )
    }
}

struct NewMusic_Previews: PreviewProvider {
    static var previews: some View {
        NewMusic()
    }
}
