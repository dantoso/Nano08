//
//  MainCoordinator.swift
//  Peptobismol
//


import SwiftUI

final class MainCoordinator: ObservableObject, Coordinator {
	var creators: [ViewCreator]

	init(creators: [ViewCreator]) {
		self.creators = creators
	}
	
	func start() {
		
	}
	
//	func createMainView() -> AnyView {
//
//	}
//
//	func createSoundPickerView() -> AnyView {
//
//	}
//	
//	func createTimerView() -> AnyView {
//
//	}
//
//	func createTimePickerView() -> AnyView {
//
//	}
	
}
