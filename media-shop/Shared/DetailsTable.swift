//
//  DetailsTable.swift
//  media-shop
//
//  Created by Michał Kierzkowski on 02/11/2020.
//

import SwiftUI

struct DetailsTable: View {
    var item : Product
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
    
    func getDetails(from detailsItem: Product) -> [Detail] {
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
        } else if detailsItem is Movie {
            var detailsArray = [Detail]()
            let detailMovie = detailsItem as! Movie
            detailsArray.append(Detail(id: 1, header: "Tytuł:", data: detailMovie.title))
            detailsArray.append(Detail(id: 2, header: "Reżyser:", data: detailMovie.director))
            detailsArray.append(Detail(id: 3, header: "Aktorzy:", data: detailMovie.actors.joined(separator: ", ")))
            detailsArray.append(Detail(id: 4, header: "Czas trwania:", data: detailMovie.durationTime))
            detailsArray.append(Detail(id: 5, header: "Język oryginału:", data: detailMovie.originalLanguage))
            detailsArray.append(Detail(id: 6, header: "Lektor:", data: detailMovie.narrator ? "Tak" : "Nie"))
            if detailMovie.narrator {
                detailsArray.append(Detail(id: 7, header: "Języki lektora:", data: detailMovie.narratorLanguages.joined(separator: ", ")))
            }
            detailsArray.append(Detail(id: 8, header: "Polski dubbing:", data: detailMovie.polishDub ? "Tak" : "Nie"))
            detailsArray.append(Detail(id: 9, header: "Języki napisów:", data: detailMovie.subLanguages.joined(separator: ", ")))
            detailsArray.append(Detail(id: 10, header: "Dystrybutor:", data: detailMovie.distributor))
            detailsArray.append(Detail(id: 11, header: "Producent:", data: detailMovie.producer))
            detailsArray.append(Detail(id: 12, header: "Data premiery:", data: detailMovie.premiereDate))
            detailsArray.append(Detail(id: 13, header: "Nośnik:", data: detailMovie.storageMedia))
            detailsArray.append(Detail(id: 14, header: "Liczba nośników:", data: detailMovie.storageAmount))
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
