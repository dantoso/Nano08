//
//  TunesView.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

/// Pressent this view using .sheet modifier on a button
struct TunesView: View {
    
    @StateObject var viewModel = TunesViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    Group{
                        Button("Tone Store") {
                            viewModel.redirectToITunes()
                        }
                        Button("Download All Purchased Tones") {
                        }
                    }
                } header: {
                    Text("Store")
                } footer: {
                    Text("This will download all ringtones and alerts purchased using the \"apple@gmail.com\" account.")
                }
                
                Section {
                    ForEach(viewModel.tunes) { tune in
                        CheckButton(selectedTune: $viewModel.selectedTuneID, id: tune.id, text: tune.name)
                    }
                    ClassicButton(viewModel: viewModel)
                }
                
                Section{
                    Button {
                        
                    } label: {
                        Text("Stop Playback")
                    }
                }
                .tint(Color(UIColor.label))
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("When Timer Ends")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.set()
                        dismiss()
                    } label: {
                        Text("Set")
                            .bold()
                    }

                }
            }
            .tint(.orange)
        }
    }
}

struct TunesView_Previews: PreviewProvider {
    static var previews: some View {
        TunesView()
            .preferredColorScheme(.dark)
    }
}

struct CheckButton: View {
    
    @Binding var selectedTune: UUID
    var id: UUID
    var text: String
    
    var body: some View {
        Button {
            selectedTune = id
        } label: {
            ZStack{
                HStack{
                    Image(systemName: "checkmark")
                        .font(.body.bold())
                        .isHidden(selectedTune != id)
                    Text(text)
                        .padding(.leading, 10)
                        .tint(Color(UIColor.label))
                    Spacer()
                }
            }
        }
    }
}


struct ClassicButton: View {
    
    @ObservedObject var viewModel: TunesViewModel
    
    var body: some View {
        NavigationLink(destination: ClassicsView(viewModel: viewModel)) {
            HStack{
                Image(systemName: "checkmark")
                    .font(.body.bold())
                    .foregroundColor(.orange)
                    .isHidden(viewModel.isClassicSelected())
                
                Text("Classic")
                    .padding(.leading, 10)
                    .tint(Color(UIColor.label))
                Spacer()
            }
        }
    }
}

