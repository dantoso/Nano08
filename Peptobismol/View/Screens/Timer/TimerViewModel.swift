//
//  TimerViewModel.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

class TimerViewModel: ObservableObject{
    
	let timeLimit: TimeInterval
	let updateInterval: CGFloat
	
	@Published var isPlaying = true
	@Published var circlePercentage: CGFloat = 1
	@Published var timeLeft: CGFloat
	@Published var timeCounter: Timer.TimerPublisher
	
	init(timeLimit: TimeInterval) {
		self.timeLimit = timeLimit
		self.updateInterval = timeLimit*0.01
		self.timeLeft = timeLimit
		self.timeCounter = Timer.publish(every: updateInterval, on: .main, in: .common)
		let _ = timeCounter.connect()
	}
	
	func update() {
		guard isPlaying else {return}
		guard circlePercentage != 0 else {return}
				
		timeLeft -= updateInterval
		let newPercentage = timeLeft/CGFloat(timeLimit)
		withAnimation {
			circlePercentage = newPercentage
		}
		
	}
	
	
}
