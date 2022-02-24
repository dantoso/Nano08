//
//  ContentView.swift
//  Peptobismol
//
//  Created by Matheus Dantas on 22/02/22.
//

import SwiftUI

struct MainView: View {
	
	@ObservedObject var viewModel = MainViewModel()
	
    var body: some View {
		Text("dadada")
    }
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .preferredColorScheme(.dark)
        }
    }
}

