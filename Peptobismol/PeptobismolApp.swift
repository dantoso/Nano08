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
			TimerView(timeLimit: 10)
//            MainView()
//				.environmentObject(MainCoordinator(creators: <#T##[ViewCreator]#>))
        }
    }
}
