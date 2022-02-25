//
//  TimePickerView.swift
//  Peptobismol
//
//  Created by Matheus Dantas on 24/02/22.
//

import SwiftUI


struct TimePickerView: View {
	
	@Binding var tempo: [Int]
	let hhmmss: [[Int]]
	
	var body: some View {
		ZStack {
			MultiPicker(selections: self.$tempo, horas: hhmmss)
				.onReceive([self.tempo].publisher.first(), perform: {(value) in
					print(value)
				})
			Text("h")
				.offset(x:-80, y:0)
				.font(.system(size: 20))
			Text("m")
				.offset(x:25, y:0)
				.font(.system(size: 20))
			Text("s")
				.offset(x:125, y:0)
				.font(.system(size: 20))
		}
		.padding(.vertical)
	}
}
