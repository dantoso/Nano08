//
//  ContentView.swift
//  Peptobismol
//
//  Created by Matheus Dantas on 22/02/22.
//

import SwiftUI

struct MainView: View {
	
	@ObservedObject var viewModel = MainViewModel()
    
    @State private var tempo: [Int] = [0, 0, 0]
    @State private var isEnabled: Bool = false
    @State private var timeState: TimeState = .start
    @State private var timerEndsIsActive: Bool = false
    
    private let hhmmss: [[Int]] = [[Int](0..<24), [Int](0..<60), [Int](0..<60)]
	
    var body: some View {
        VStack {
            ZStack {
                MultiPicker(selections: self.$tempo, horas: hhmmss)
                    .onReceive([self.tempo].publisher.first(), perform: {(value) in
                        print(value)
                    })
                Text("h")
                    .offset(x:-80, y:0)
                    .font(.system(size: 20))
                Text("m")
                    .offset(x:25, y:0)
                    .font(.system(size: 20))
                Text("s")
                    .offset(x:125, y:0)
                    .font(.system(size: 20))
            }
            .padding(.vertical)
            
            HStack {
                CancelButton(isEnabled: $isEnabled, action: {
                    print("cancelado")
                })
                    .padding([.horizontal, .top])
                Spacer()
                StartButton(timeState: $timeState, action: {
                    print("bacana")
                })
                    .padding([.horizontal, .top])
            }
            
            Form {
                Button {
                    timerEndsIsActive.toggle()
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
                .sheet(isPresented: $timerEndsIsActive, onDismiss: {viewModel.fetchTuneNameOptimized()}) {
                    TunesView()
                }
                .padding(.vertical, 10)
            }
        }
        .onAppear(perform: {viewModel.fetchTuneNameOptimized()})
    }
	
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}

