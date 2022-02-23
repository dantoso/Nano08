//
//  ViewCreators.swift
//  Peptobismol
//
//  Created by Matheus Dantas on 23/02/22.
//

import SwiftUI

protocol ViewCreator {
//	var indentifier: String {get}
	
	func createView() -> AnyView
}
