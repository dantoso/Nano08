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
    
    func fetchTuneNameOptimized() {
        let tuneID = UserDefaults.standard.integer(forKey: "SelectedTuneID")
        var tunes: [TuneModel] = TuneModel.fetchTunes()
        tunes.append(contentsOf: TuneModel.fetchClassicTunes())
        
        var ini = 0
        var fim = tunes.count - 1
        var meio: Int
        var resposta = ""
        
        while (ini <= fim) {
            meio = (ini + fim) / 2
            if (tuneID == tunes[meio].id) {
                resposta = tunes[meio].name
                break
            }
            if (tuneID < tunes[meio].id) {
                fim = meio - 1
            }
            else {
                ini = meio + 1
            }
        }
        
        activeTune = resposta
    }
}
