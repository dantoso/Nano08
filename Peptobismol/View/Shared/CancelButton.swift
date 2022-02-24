//
//  CancelButton.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/02/22.
//

import SwiftUI

struct CancelButton: View {
    
    @Binding var isEnabled: Bool
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Button(action: action) {
                Image("CircleButton")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .foregroundColor(.gray)
                    .opacity(0.2)
            }
            
            Text("Cancel")
                .foregroundColor(isEnabled ? .white : Color(uiColor: .tertiaryLabel))
        }
    }
}

struct CancelButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton(isEnabled: Binding<Bool>.constant(false), action: {})
            .preferredColorScheme(.dark)
    }
}
