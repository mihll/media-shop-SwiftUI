import SwiftUI

struct Music: Hashable, Codable, Identifiable, Content {
    var id: Int
    var title: String
    var price: String
    var mainImageName: String
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
