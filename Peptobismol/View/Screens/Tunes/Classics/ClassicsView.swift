//
//  ClassicsView.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

struct ClassicsView: View {
    
    @ObservedObject var viewModel: TunesViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form{
            ForEach(viewModel.classicTunes) { tune in
                CheckButton(selectedTune: $viewModel.selectedTuneID, id: tune.id, text: tune.name)
            }
        }
        .navigationTitle("Classic")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: dismiss.callAsFunction) {
                    Image(systemName: "chevron.left")
                        .font(.body.bold())
                    Text("Back")
                }
            }
        }
        .tint(.orange)
    }
}

struct ClassicsView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicsView(viewModel: TunesViewModel())
            .preferredColorScheme(.dark)
    }
}
