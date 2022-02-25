//
//  TimerViewModel.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

class TimerViewModel: ObservableObject{
    
    var timeLimit: TimeInterval{
        didSet{
            guard timeLimit != oldValue else {return}
            timeLeft = timeLimit
            UserDefaults.standard.set(timeLeft, forKey: "timeLeft")
        }
    }

    var firstTime:Bool
	let updateInterval: CGFloat
	
	@Published var isPlaying = true
	@Published var circlePercentage: CGFloat = 1
	@Published var timeLeft: CGFloat
	@Published var timeCounter: Timer.TimerPublisher
	
	init() {
		print("criando view model")
        firstTime = true
        self.timeLimit = UserDefaults.standard.double(forKey: "secondsKey")
        self.updateInterval = 0.1
		self.timeLeft = timeLimit
		self.timeCounter = Timer.publish(every: updateInterval, on: .main, in: .common)
		let _ = timeCounter.connect()
		
		createObservers()
		
	}
    
    func reinit() {
        print("reinitizando")
        timeLimit = UserDefaults.standard.double(forKey: "secondsKey")
        timeLeft = CGFloat(UserDefaults.standard.double(forKey: "timeLeft"))
    }
	
	deinit {
		print("descriando view model")
		NotificationCenter.default.removeObserver(self)
	}
	
	func update() {
		guard isPlaying == true  else {return}
		guard timeLeft > 0 else {
            timeLimit = 0
			NotificationCenter.default.post(name: .timerFinished, object: nil)
			
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
            UserDefaults.standard.set(self?.timeLeft, forKey: "timeLeft")
            self?.isPlaying = false
		}
		
		NotificationCenter.default.addObserver(forName: .resumeBtnTap, object: nil, queue: nil) { [weak self] _ in
			self?.isPlaying = true
		}
		
        NotificationCenter.default.addObserver(forName: .cancelBtnTap, object: nil, queue: nil) { [weak self] _ in
            UserDefaults.standard.set(self?.timeLimit, forKey: "timeLeft")
            self?.isPlaying = true
        }
        
	}
	
	
}
