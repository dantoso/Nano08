//
//  MainCoordinator.swift
//  Peptobismol
//


import SwiftUI

final class MainCoordinator: ObservableObject, Coordinator {

    let timerViewModel: TimerViewModel
    
    init(_ timerViewModel: TimerViewModel) {
        self.timerViewModel = timerViewModel
    }
    
    //	var creators: [ViewCreator]
//
//	init(creators: [ViewCreator]) {
//		self.creators = creators
//	}
	
//	func createMainView() -> AnyView {
//
//	}

	func createTunesView() -> some View {
		return TunesView()
	}

	
	func createTimerView(timeLimit: [Int]) -> some View {
		
		var seconds: TimeInterval = 0
		
		seconds += TimeInterval(timeLimit[0] * 3600)
		seconds += TimeInterval(timeLimit[1] * 60)
		seconds += TimeInterval(timeLimit[2])
		
        UserDefaults.standard.set(seconds, forKey: "secondsKey")
        timerViewModel.reinit()
        
        return TimerView()
	}

	func createTimePickerView(tempo: Binding<[Int]>, hhmmss: [[Int]]) -> some View {
		return TimePickerView(tempo: tempo, hhmmss: hhmmss)
	}
	
}
