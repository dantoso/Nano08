//
//  ContentView.swift
//  Peptobismol
//
//  Created by Matheus Dantas on 22/02/22.
//

import SwiftUI

struct ContentView: View {
    
    let coordinator = MainCoordinator()
    
    var body: some View {
        NavigationView {
            NavigationLink("Timer View") {
                coordinator.buildView()
            }
            NavigationLink("Timer View") {
                coordinator.buildView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
