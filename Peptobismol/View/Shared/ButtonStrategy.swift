//
//  ButtonStrategy.swift
//  Peptobismol
//
//  Created by Matheus Dantas on 24/02/22.
//

import SwiftUI

protocol ButtonStrategy {
	var name: String {get}
	var color: Color {get}
	func action()
}

struct ResumeState: ButtonStrategy {
	var name: String {"Resume"}
	
	var color: Color {.green}
	
	func action() {
		NotificationCenter.default.post(name: .resumeBtnTap, object: nil)
	}
}

struct PauseState: ButtonStrategy {
	var name: String {"Pause"}
	
	var color: Color {.orange}
	
	func action() {
		NotificationCenter.default.post(name: .pauseBtnTap, object: nil)
	}
}

struct StartState: ButtonStrategy {
	var name: String {"Start"}
	var color: Color {.green}
	
	func action() {
		NotificationCenter.default.post(name: .startBtnTap, object: nil)
	}
}

