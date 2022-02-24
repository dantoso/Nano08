//
//  TuneModel.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import Foundation

struct TuneModel: Identifiable{
    let id = UUID()
    let name: String
}

extension TuneModel{
    static func fetchTunes() -> [TuneModel] {
        return [
            TuneModel(name: "Radar (Default)"),
            TuneModel(name: "Apex"),
            TuneModel(name: "Beacon"),
            TuneModel(name: "Bulletin"),
            TuneModel(name: "By The Seaside"),
            TuneModel(name: "Chimes"),
            TuneModel(name: "Circuit"),
            TuneModel(name: "Constellation"),
            TuneModel(name: "Cosmic"),
            TuneModel(name: "Crystals"),
            TuneModel(name: "Hillside"),
            TuneModel(name: "Illumiate")
        ]
    }
    
    static func fetchClassicTunes() -> [TuneModel] {
        return [
            TuneModel(name: "Alarm"),
            TuneModel(name: "Ascending"),
            TuneModel(name: "Bark"),
            TuneModel(name: "Bell Tower"),
            TuneModel(name: "Blues"),
            TuneModel(name: "Boing"),
            TuneModel(name: "Crickets"),
            TuneModel(name: "Digital"),
            TuneModel(name: "Doorbell"),
            TuneModel(name: "Duck"),
            TuneModel(name: "Harp"),
            TuneModel(name: "Marimba"),
            TuneModel(name: "Motorcycle"),
            TuneModel(name: "Old Car Horn"),
            TuneModel(name: "Old Phone"),
            TuneModel(name: "Piano Riff")
        ]
    }
}

