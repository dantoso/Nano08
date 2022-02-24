//
//  TuneModel.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import Foundation

struct TuneModel: Identifiable{
    let id: Int
    let name: String
}

extension TuneModel{
    static func fetchTunes() -> [TuneModel] {
        return [
            TuneModel(id: 0, name: "Radar (Default)"),
            TuneModel(id: 1, name: "Apex"),
            TuneModel(id: 2, name: "Beacon"),
            TuneModel(id: 3, name: "Bulletin"),
            TuneModel(id: 4, name: "By The Seaside"),
            TuneModel(id: 5, name: "Chimes"),
            TuneModel(id: 6, name: "Circuit"),
            TuneModel(id: 7, name: "Constellation"),
            TuneModel(id: 8, name: "Cosmic"),
            TuneModel(id: 9, name: "Crystals"),
            TuneModel(id: 10, name: "Hillside"),
            TuneModel(id: 11, name: "Illumiate")
        ]
    }
    
    static func fetchClassicTunes() -> [TuneModel] {
        return [
            TuneModel(id: 12, name: "Alarm"),
            TuneModel(id: 13, name: "Ascending"),
            TuneModel(id: 14, name: "Bark"),
            TuneModel(id: 15, name: "Bell Tower"),
            TuneModel(id: 16, name: "Blues"),
            TuneModel(id: 17, name: "Boing"),
            TuneModel(id: 18, name: "Crickets"),
            TuneModel(id: 19, name: "Digital"),
            TuneModel(id: 20, name: "Doorbell"),
            TuneModel(id: 21, name: "Duck"),
            TuneModel(id: 22, name: "Harp"),
            TuneModel(id: 23, name: "Marimba"),
            TuneModel(id: 24, name: "Motorcycle"),
            TuneModel(id: 25, name: "Old Car Horn"),
            TuneModel(id: 26, name: "Old Phone"),
            TuneModel(id: 27, name: "Piano Riff")
        ]
    }
}

