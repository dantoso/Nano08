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
	var updateInterval: TimeInterval {timeLimit*0.001}
	
	// TODO: botar na view model depois
	@State var isPlaying = true
	@State var timeElapsed: CGFloat = 0
	@State var circlePercentage: CGFloat = 1
	@State var timeCounter = Timer.publish(every: 1, on: .main, in: .common)
	
	var body: some View {
		
		ZStack {
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
			// update ui
		}
		
	}
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        LoadCircle(timeLimit: 60)
    }
}
