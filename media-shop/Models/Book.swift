//
//  Book.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 05/12/2020.
//

import SwiftUI

struct Book: Hashable, Codable, Identifiable, Product {
    var id: Int
    var title: String
    var price: Double
    var mainImageName: String
    var author: String
    var translator: String
    var publisher: String
    var issueLanguage: String
    var originalLanguage: String
    var pagesAmount: String
    var issueNumber: String
    var premiereDate: String
    var description: String
}
