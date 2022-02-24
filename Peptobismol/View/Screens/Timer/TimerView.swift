//
//  TimerView.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LoadCircle: View {
	
	let timeLimit: TimeInterval
	let updateInterval: CGFloat
	
	// TODO: botar na view model depois
	@State var isPlaying = true
	@State var timeLeft: CGFloat
	@State var circlePercentage: CGFloat = 1
	@State var timeCounter: Timer.TimerPublisher
	
	init(timeLimit: TimeInterval) {
		self.timeLimit = timeLimit
		self.updateInterval = timeLimit*0.01
		self.timeLeft = timeLimit
		self.timeCounter = Timer.publish(every: updateInterval, on: .main, in: .common)
		let _ = timeCounter.connect()
	}
	
	var body: some View {
		
		ZStack {
			
			Text(timeFormatter())
				.font(.system(size: 100, weight: .light))
			
			Circle()
				.trim(from: 0, to: circlePercentage)
				.stroke(Color.orange, style: StrokeStyle(lineWidth: 5, lineCap: .round))
				.frame(width: 350, height: 350)
				.rotationEffect(.init(degrees: -90))
			Circle()
				.stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 5, lineCap: .round))
				.frame(width: 350, height: 350)
		}
		.onReceive(timeCounter) { _ in
			guard isPlaying else {return}
			guard circlePercentage != 0 else {return}
			
			timeLeft -= updateInterval
			let newPercentage = timeLeft/CGFloat(timeLimit)
			withAnimation {
				circlePercentage = newPercentage
			}
		}
		
	}
	
	func timeFormatter() -> String {
		return "\(Int(timeLeft))"
	}
	
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        LoadCircle(timeLimit: 30)
    }
}
