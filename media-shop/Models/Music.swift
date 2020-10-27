import SwiftUI

struct Music: Hashable, Codable, Identifiable, Content {
    var id: Int
    var title: String
    var price: String
    var mainImageName: String
    var artist: String
    var year: String
}
