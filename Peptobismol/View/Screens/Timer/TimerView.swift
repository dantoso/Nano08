//
//  TimerView.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

struct TimerView: View {
	
	@EnvironmentObject var viewModel: TimerViewModel
	
	var body: some View {
		
		ZStack {
			Text(viewModel.timeFormatter())
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
	
}

//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
////        TimerView(timeLimit: 30)
//    }
//}
