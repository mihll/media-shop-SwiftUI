//
//  trackList.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 29/10/2020.
//

import SwiftUI

struct TrackList: View {
    var tracks: [Track]
    var body: some View {
        List(tracks) { track in
            Text("\(track.trackNumber)")
            Text(track.trackName)
                .padding(.leading)
            Spacer()
            Image(systemName: "play.circle").imageScale(.large)
        }
    }
}

struct trackList_Previews: PreviewProvider {
    static var previews: some View {
        TrackList(tracks: musicData[0].trackList)
    }
}
