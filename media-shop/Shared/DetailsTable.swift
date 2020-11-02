//
//  DetailsTable.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 02/11/2020.
//

import SwiftUI

struct DetailsTable: View {
    var item : Content
    var body: some View {
        Text("Dane szczegółowe")
            .font(.title)
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack(spacing: 0){
            ForEach(getDetails(from: item)) { detail in
                DetailsTableRow(header: detail.header, data: detail.data)
            }
        }
    }
    
    func getDetails(from detailsItem: Content) -> [Detail] {
        if detailsItem is Music {
            var detailsArray = [Detail]()
            let detailMusic = detailsItem as! Music
            detailsArray.append(Detail(id: 1, header: "Tytuł:", data: detailMusic.title))
            detailsArray.append(Detail(id: 2, header: "Wykonawca:", data: detailMusic.artist))
            detailsArray.append(Detail(id: 3, header: "Dystrybutor:", data: detailMusic.distributor))
            detailsArray.append(Detail(id: 4, header: "Data premiery:", data: detailMusic.premiereDate))
            detailsArray.append(Detail(id: 5, header: "Rok nagrania:", data: detailMusic.year))
            detailsArray.append(Detail(id: 6, header: "Producent:", data: detailMusic.producer))
            detailsArray.append(Detail(id: 7, header: "Nośnik:", data: detailMusic.storageMedia))
            detailsArray.append(Detail(id: 8, header: "Liczba nośników:", data: detailMusic.storageAmount))
            detailsArray.append(Detail(id: 9, header: "Rodzaj opakowania:", data: detailMusic.caseType))
            if detailMusic.caseSize != "" {
                detailsArray.append(Detail(id: 10, header: "Wymiary w opakowaniu [mm]:", data: detailMusic.caseSize))
            }
            return detailsArray
        } else {
            return []
        }
    }
    
}

struct DetailsTable_Previews: PreviewProvider {
    static var previews: some View {
        DetailsTable(item: musicData[0])
    }
}
