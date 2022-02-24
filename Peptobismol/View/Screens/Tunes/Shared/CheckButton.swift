//
//  CheckButton.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/02/22.
//

import SwiftUI

struct CheckButton: View {
    
    @Binding var selectedTune: Int
    var id: Int
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

struct CheckButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckButton(selectedTune: Binding<Int>.constant(0), id: 0, text: "Hello World!")
            .previewLayout(.fixed(width: 400.0, height: 50.0))
    }
}
