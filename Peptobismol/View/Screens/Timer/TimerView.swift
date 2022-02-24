//
//  TimerView.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

struct TimerView: View {
	
	@ObservedObject var viewModel: TimerViewModel
	
	init(timeLimit: TimeInterval) {
		viewModel = TimerViewModel(timeLimit: timeLimit)
	}
	
	var body: some View {
		
		ZStack {
			
			Text(timeFormatter())
				.font(.system(size: 80, weight: .light))
			
			Circle()
				.trim(from: 0, to: viewModel.circlePercentage)
				.stroke(Color.orange, style: StrokeStyle(lineWidth: 5, lineCap: .round))
				.frame(width: 350, height: 350)
				.rotationEffect(.init(degrees: -90))
			Circle()
				.stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 5, lineCap: .round))
				.frame(width: 350, height: 350)
		}
		.onReceive(viewModel.timeCounter) { _ in
			viewModel.update()
		}
		
	}
	
	func timeFormatter() -> String {
        var timer = ""
        let currentTimeLeft = Int(viewModel.timeLeft)
        let hours = currentTimeLeft / 3600
        let minutes = currentTimeLeft % 3600 / 60
        let seconds = currentTimeLeft % 3600 % 60
        
        timer += hours > 0 ? validNumber(hours) + ":" : ""
        timer += minutes > 0 ? validNumber(minutes) : "00"
        timer += ":"
        timer += seconds > 0 ? validNumber(seconds) : "00"
    
		return timer
	}
    
    func validNumber(_ number: Int) -> String {
        return number > 9 ? "\(number)" : "0\(number)"
    }
	
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timeLimit: 30)
    }
}
