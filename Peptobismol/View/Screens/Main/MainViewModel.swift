//
//  ContentViewModel.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

class MainViewModel: ObservableObject{
		
	@Published var isPresentingPickerView = true
    @Published var presentTunesView = false
    @Published var activeTune: String = ""
	@Published var tempo: [Int] = [0, 0, 0]
	@Published var isEnabled: Bool = false
	@Published var buttonState: ButtonStrategy = StartState()
	@Published var timerEndsIsActive: Bool = false
    
	init() {
		createObservers()
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
    func fetchTuneName() {
        let tuneID = UserDefaults.standard.integer(forKey: "SelectedTuneID")
        var tunes: [TuneModel] = TuneModel.fetchTunes()
        tunes.append(contentsOf: TuneModel.fetchClassicTunes())
        
        guard let tuneFetched = tunes.first(where: {$0.id == tuneID}) else {return}
        
        activeTune = tuneFetched.name
    }
	
	func createObservers() {
		NotificationCenter.default.addObserver(forName: .startBtnTap, object: nil, queue: nil) { [weak self] _ in
            self?.isPresentingPickerView = false
			self?.buttonState = PauseState()
			self?.isEnabled = true
		}
		
		NotificationCenter.default.addObserver(forName: .cancelBtnTap, object: nil, queue: nil) { [weak self] _ in
            print("VO TI DIZER QUI U CANCEL TA RODANDU")
			self?.buttonState = StartState()
			self?.isPresentingPickerView = true
			self?.isEnabled = false
		}
		
		NotificationCenter.default.addObserver(forName: .timerFinished, object: nil, queue: nil) { [weak self] _ in
			self?.buttonState = StartState()
			self?.isPresentingPickerView = true
			self?.isEnabled = false
		}
		NotificationCenter.default.addObserver(forName: .pauseBtnTap, object: nil, queue: nil) { [weak self] _ in
			self?.buttonState = ResumeState()
		}
		
		NotificationCenter.default.addObserver(forName: .resumeBtnTap, object: nil, queue: nil) { [weak self] _ in
			self?.buttonState = PauseState()
		}
	}
}
