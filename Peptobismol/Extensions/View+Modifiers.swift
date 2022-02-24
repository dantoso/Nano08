//
//  View+Modifiers.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

struct HiddenModifier: ViewModifier {
    
    let hidden: Bool
    
    func body(content: Content) -> some View {
        if hidden {
            content.hidden()
        }
        else {
            content
        }
    }
}

extension View{
    
    func isHidden(_ hidden: Bool) -> some View {
        modifier(HiddenModifier(hidden: hidden))
    }
}
