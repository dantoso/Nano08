//
//  MainCoordinator.swift
//  Peptobismol
//


import SwiftUI

final class MainCoordinator: ObservableObject, Coordinator {
//	var creators: [ViewCreator]
//
//	init(creators: [ViewCreator]) {
//		self.creators = creators
//	}
	
//	func createMainView() -> AnyView {
//
//	}
//
//	func createSoundPickerView() -> AnyView {
//
//	}

	func createTimerView(timeLimit: [Int]) -> AnyView {
		
		var seconds: TimeInterval = 0
		
		seconds += TimeInterval(timeLimit[0] * 3600)
		seconds += TimeInterval(timeLimit[1] * 60)
		seconds += TimeInterval(timeLimit[2])
		
		return AnyView(TimerView(timeLimit: seconds))
				
	}

	func createTimePickerView(tempo: Binding<[Int]>, hhmmss: [[Int]]) -> AnyView {
		return AnyView(TimePickerView(tempo: tempo, hhmmss: hhmmss))
	}
	
}
