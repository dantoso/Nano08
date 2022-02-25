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


extension NSNotification.Name {
	
	static let timerFinished = Notification.Name("timerFinished")
	static let resumeBtnTap = Notification.Name("resumeBtnTap")
	static let pauseBtnTap = Notification.Name("pauseBtnTap")
	static let cancelBtnTap = Notification.Name("cancelBtnTap")
	static let startBtnTap = Notification.Name("startBtnTap")
	

}
