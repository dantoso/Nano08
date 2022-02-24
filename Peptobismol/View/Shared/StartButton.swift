//
//  StartButton.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/02/22.
//

import SwiftUI

enum TimeState: String {
    case start = "Start"
    case pause = "Pause"
    case resume = "Resume"
}

struct StartButton: View {
    
    @Binding var timeState: TimeState
    var action: () -> Void
    
    var viewColor: Color {
        return timeState == .start ? .green : .orange
    }
    
    var body: some View {
        ZStack {
            Button(action: action) {
                Image("CircleButton")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .foregroundColor(viewColor)
                    .opacity(0.2)
            }
            
            Text(timeState.rawValue)
                .foregroundColor(viewColor)
        }
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton(timeState: Binding<TimeState>.constant(.start), action: {})
            .preferredColorScheme(.dark)
    }
}
