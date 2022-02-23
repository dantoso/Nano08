//
//  MainViewCreator.swift
//  Peptobismol
//
//  Created by Matheus Dantas on 23/02/22.
//

import SwiftUI

final class MainViewCreator: ViewCreator {
	
	func createView() -> AnyView {
		
		let view = MainView()
		//setup da view q vc ta criando...
		
		return AnyView(view)
	}
}

