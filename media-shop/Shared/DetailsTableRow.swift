//
//  DetailsTableRow.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 02/11/2020.
//

import SwiftUI

struct DetailsTableRow: View {
    var header: String
    var data: String
    var body: some View {
        GeometryReader { geometry in
            HStack(){
                HStack(){
                    Spacer()
                    Text(header)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.trailing)
                        .minimumScaleFactor(0.5)
                }
                .frame(width: geometry.size.width/3)
                Divider()
                Text(data)
            }
        }
        .frame(minHeight: 50)
        Divider()
    }
}

struct DetailsTableRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailsTableRow(header: "Tytuł:", data: "Ghost Stories")
    }
}
