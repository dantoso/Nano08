//
//  Coordinator.swift
//  Peptobismol
//
//  Created by Matheus Dantas on 23/02/22.
//

import SwiftUI

protocol Coordinator {
	var creators: [ViewCreator] {get set}
	
	func start()
}

