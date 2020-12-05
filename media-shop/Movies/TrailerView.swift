//
//  TrailerView.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 18/11/2020.
//

import SwiftUI
import AVKit

struct TrailerView: View {
    var trailerFileName: String
    var body: some View {
        Text("Zwiastun")
            .font(.title)
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .leading)
        VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: trailerFileName, withExtension: "mp4")!))
            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
            .frame(minHeight: 300)
    }
}

struct TrailerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerView(trailerFileName: "the_social_network")
    }
}
