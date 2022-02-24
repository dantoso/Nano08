//
//  TunesViewModel.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

class TunesViewModel: ObservableObject {
    
    @Published var selectedTuneID: UUID!
    
    init(){
        setSelectedTuneID()
    }
    
    let tunes = TuneModel.fetchTunes()
    let classicTunes = TuneModel.fetchClassicTunes()
    
    func set(){
        let tune = getSelectedTune()
        UserDefaults.standard.set(tune.name, forKey: "SelectedTuneName")
    }
    
    func isClassicSelected() -> Bool {
        return tunes.contains(where: {$0.id == selectedTuneID})
    }
    
    func redirectToITunes(){
        guard let url = URL(string: "https://apps.apple.com/us/app/pop-odyssey/id1584663654?itsct=apps_box_link&itscg=30200"), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    private func getSelectedTune() -> TuneModel {
        if let tune = tunes.first(where: { $0.id == selectedTuneID }) {
            return tune
        }
        else if let classicTune = classicTunes.first(where: { $0.id == selectedTuneID }) {
            return classicTune
        }
        return tunes[0]
    }
    
    private func setSelectedTuneID(){
        if let savedTuneName = UserDefaults.standard.string(forKey: "SelectedTuneName") {
            if let tuneID = tunes.first(where: { $0.name == savedTuneName })?.id {
                selectedTuneID = tuneID
            }
            else if let classicTuneID  = classicTunes.first(where: { $0.name == savedTuneName })?.id {
                selectedTuneID = classicTuneID
            }
        }
        else{
            selectedTuneID = tunes[0].id
        }
    }
}
