//
//  Movie.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 18/11/2020.
//

import SwiftUI

struct Movie: Hashable, Codable, Identifiable, Product {
    var id: Int
    var title: String
    var price: Double
    var mainImageName: String
    var director: String
    var actors: [String]
    var producer: String
    var distributor: String
    var premiereDate: String
    var durationTime: String
    var originalLanguage: String
    var narrator: Bool
    var narratorLanguages: [String]
    var polishDub: Bool
    var subLanguages: [String]
    var storageMedia: String
    var storageAmount: String
    var description: String
    var trailerFileName: String
}
