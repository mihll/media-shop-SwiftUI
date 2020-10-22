import SwiftUI

struct Music: Hashable, Codable, Identifiable {
    var id: Int
    var albumTitle: String
    var artist: String
    var year: String
    var price: String
    fileprivate var coverImageName: String
}

extension Music {
    var cover: Image {
        ImageStore.shared.image(name: coverImageName)
    }
}
