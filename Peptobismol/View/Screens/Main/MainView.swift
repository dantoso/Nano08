//
//  ContentView.swift
//  Peptobismol
//
//  Created by Matheus Dantas on 22/02/22.
//

import SwiftUI

struct MainView: View {
	
	@ObservedObject var viewModel = MainViewModel()
	@EnvironmentObject var coordinator: MainCoordinator
    
    private let hhmmss: [[Int]] = [[Int](0..<24), [Int](0..<60), [Int](0..<60)]
	
    var body: some View {
        VStack {
            
			if viewModel.isPresentingPickerView {
				coordinator.createTimePickerView(tempo: $viewModel.tempo, hhmmss: hhmmss)
			}
			else {
				coordinator.createTimerView(timeLimit: viewModel.tempo)
			}
			
            
            HStack {
				CancelButton(isEnabled: $viewModel.isEnabled, action: {
                    NotificationCenter.default.post(name: .cancelBtnTap, object: nil)
					
                })
                Spacer()
				StartButton(strategy: $viewModel.buttonState)
            }
            
            Form {
                Button {
					viewModel.timerEndsIsActive.toggle()
                } label: {
                    HStack {
                        Text("When Timer Ends")
                            .foregroundColor(.white)
                        Spacer()
                        Text(viewModel.activeTune)
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.body.bold())
                    }
                }
				.sheet(isPresented: $viewModel.timerEndsIsActive, onDismiss: {viewModel.fetchTuneName()}) {
                    TunesView()
                }
            }
        }
        .onAppear(perform: {viewModel.fetchTuneName()})
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}

