import SwiftUI

struct Music: Hashable, Codable, Identifiable, Product {
    var id: Int
    var title: String
    var price: Double
    var mainImageName: String
    var backImageName: String
    var distributor : String
    var premiereDate : String
    var producer : String
    var storageMedia : String
    var storageAmount : String
    var caseType : String
    var caseSize : String
    var artist: String
    var year: String
    var description: String
    var trackList: [Track]
}

extension Music {
    var backImage: Image {
        ImageStore.shared.image(name: backImageName)
    }
}
