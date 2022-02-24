//
//  TunesViewModel.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

class TunesViewModel: ObservableObject {
    
    @Published var selectedTuneID: Int!
    
    init(){
        setSelectedTuneID()
    }
    
    let tunes = TuneModel.fetchTunes()
    let classicTunes = TuneModel.fetchClassicTunes()
    
    func set(){
        UserDefaults.standard.set(selectedTuneID, forKey: "SelectedTuneID")
    }
    
    func isClassicSelected() -> Bool {
        return tunes.contains(where: {$0.id == selectedTuneID})
    }
    
    func redirectToITunes(){
        guard let url = URL(string: "https://apps.apple.com/us/app/pop-odyssey/id1584663654?itsct=apps_box_link&itscg=30200"), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    private func setSelectedTuneID(){
        selectedTuneID = UserDefaults.standard.integer(forKey: "SelectedTuneID")
    }
}
