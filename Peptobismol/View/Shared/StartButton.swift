//
//  StartButton.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/02/22.
//

import SwiftUI

//enum ButtonState: String {
//    case start = "Start"
//    case pause = "Pause"
//    case resume = "Resume"
//}

struct StartButton: View {
    
    @Binding var strategy: ButtonStrategy
    
    var body: some View {
        ZStack {
			Button(action: strategy.action) {
                Image("CircleButton")
                    .resizable()
                    .frame(width: 90, height: 90)
					.foregroundColor(strategy.color)
                    .opacity(0.2)
            }
            
			Text(strategy.name)
				.foregroundColor(strategy.color)
        }
    }
}

//struct StartButton_Previews: PreviewProvider {
//    static var previews: some View {
//        StartButton(timeState: Binding<ButtonState>.constant(.start), action: {})
//            .preferredColorScheme(.dark)
//    }
//}
