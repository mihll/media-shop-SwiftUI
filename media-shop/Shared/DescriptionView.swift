//
//  DescriptionView.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 02/11/2020.
//

import SwiftUI

struct DescriptionView: View {
    var descriptionText: String
    @State private var isExpanded: Bool = false

    var body: some View {
        Text("Opis")
            .font(.title)
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .leading)
        Text(descriptionText)
            .animation(.easeInOut)
            .lineLimit(isExpanded ? nil : 3)
            .overlay(
                GeometryReader { proxy in
                    Button(action: {
                        isExpanded.toggle()
                    }) {
                        Text(isExpanded ? "...mniej" : "...więcej")
                            .font(.caption).bold()
                            .padding(.leading, 8.0)
                            .padding(.top, 4.0)
                            .background(Color(UIColor.systemBackground))
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                }
            )
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(descriptionText: "TO JEST TESTOWY OPIS JAKIŚ")
    }
}
