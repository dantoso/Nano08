//
//  MainCoordinator.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

protocol Coordinator{
    func buildView() -> AnyView
}

class MainCoordinator: Coordinator {
    
    func buildView() -> AnyView {
        return AnyView(TimerView())
    }
    
}
