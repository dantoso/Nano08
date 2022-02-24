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
		print("criando view model")
		self.timeLimit = timeLimit
        self.updateInterval = 0.1
		self.timeLeft = timeLimit
		self.timeCounter = Timer.publish(every: updateInterval, on: .main, in: .common)
		let _ = timeCounter.connect()
		
		createObservers()
		
	}
	
	deinit {
		print("descriando view model")
		NotificationCenter.default.removeObserver(self)
	}
	
	func update() {
		guard isPlaying == true  else {return}
		guard timeLeft > 0 else {
			NotificationCenter.default.post(name: .timerFinished, object: nil)
			isPlaying = false
			return
		}
				
		timeLeft -= updateInterval
		let newPercentage = timeLeft/CGFloat(timeLimit)
		withAnimation {
			circlePercentage = newPercentage
		}
		
	}
	
	func createObservers() {
		
		NotificationCenter.default.addObserver(forName: .pauseBtnTap, object: nil, queue: nil) { [weak self] _ in
			self?.isPlaying = false
		}
		
		NotificationCenter.default.addObserver(forName: .resumeBtnTap, object: nil, queue: nil) { [weak self] _ in
			self?.isPlaying = true
		}
		
	}
	
	
}
