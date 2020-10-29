//
//  trackList.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 29/10/2020.
//

import SwiftUI
import SwiftySound

struct TrackList: View {
    var tracks: [Track]
    @State private var currentTrackId: Int = -1
    @State private var mySound = Sound(url: Bundle.main.url(forResource: "gs1", withExtension: "mp3")!)
    
    var body: some View {
        VStack(){
            Text("Lista utworów")
                .font(.title)
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(tracks) { track in
                HStack(){
                    Text("\(track.trackNumber)")
                    Text(track.trackName)
                        .padding(.leading)
                    Spacer()
                    if currentTrackId == track.id {
                        Button(action: {
                                currentTrackId = -1
                                self.mySound?.stop()                     }) {
                            Image(systemName: "pause.circle.fill").imageScale(.large)
                        }
                    } else {
                        Button(action: {
                            currentTrackId = track.id
                            playSample(fileName: track.audioFileName)
                        }) {
                            Image(systemName: "play.circle").imageScale(.large)
                        }
                    }
                }
                Divider()
            }
        }.onDisappear {
            Sound.stopAll()
        }
    }
    
    func playSample(fileName: String) {
        self.mySound?.stop()
        self.mySound = Sound(url: Bundle.main.url(forResource: fileName, withExtension: "mp3")!)
        self.mySound?.play() { completed in
            currentTrackId = -1
        }
    }
}

struct trackList_Previews: PreviewProvider {
    static var previews: some View {
        TrackList(tracks: musicData[0].trackList)
    }
}
