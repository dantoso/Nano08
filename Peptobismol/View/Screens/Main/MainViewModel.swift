//
//  ContentViewModel.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

class MainViewModel: ObservableObject{
    @Published var presentTunesView = false
    @Published var activeTune: String = ""
    
    func fetchTuneName() {
        let tuneID = UserDefaults.standard.integer(forKey: "SelectedTuneID")
        var tunes: [TuneModel] = TuneModel.fetchTunes()
        tunes.append(contentsOf: TuneModel.fetchClassicTunes())
        
        guard let tuneFetched = tunes.first(where: {$0.id == tuneID}) else {return}
        
        activeTune = tuneFetched.name
    }
}
