import SwiftUI

struct Track: Hashable, Codable, Identifiable{
    var id: Int
    var trackNumber: Int
    var trackName: String
    var audioFileName: String
}
