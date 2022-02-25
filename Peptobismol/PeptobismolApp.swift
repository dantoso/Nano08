//
//  PeptobismolApp.swift
//  Peptobismol
//
//  Created by Matheus Dantas on 22/02/22.
//

import SwiftUI

@main
struct PeptobismolApp: App {
    var body: some Scene {
        WindowGroup {
//			TimerView(timeLimit: 3603)
            
            let timerViewModel = TimerViewModel()
            
            MainView()
                .preferredColorScheme(.dark)
				.environmentObject(MainCoordinator(timerViewModel))
                .environmentObject(timerViewModel)
        }
    }
}

