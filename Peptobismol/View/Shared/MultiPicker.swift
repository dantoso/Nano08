//
//  MultiPicker.swift
//  Peptobismol
//
//  Created by Paulo César on 24/02/22.
//

import Foundation
import UIKit
import SwiftUI

struct MultiPicker: UIViewRepresentable {
    var selections: Binding<[Int]>
    let horas: [[Int]]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MultiPicker>) -> UIPickerView {
        let picker = UIPickerView()
        picker.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIView(_ view: UIPickerView, context: UIViewRepresentableContext<MultiPicker>) {
        for comp in selections.indices {
            if let row = horas[comp].firstIndex(of: selections.wrappedValue[comp]) {
                view.selectRow(row, inComponent: comp, animated: false)
            }
        }
    }
    
    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: MultiPicker
          
        init(_ pickerView: MultiPicker) {
            parent = pickerView
        }
            
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return parent.horas.count
        }
            
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return parent.horas[component].count
        }
            
//        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//            return 48
//        }
        
//        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
//        {
//            let pickerLabel = UILabel()
//            pickerLabel.textColor = .black
//            pickerLabel.text = "\(parent.horas[component][row])"
//            pickerLabel.font = UIFont.boldSystemFont(ofSize: 13)
//            pickerLabel.textAlignment = .right
//            return pickerLabel
//        }
            
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return String(parent.horas[component][row])
        }
            
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            parent.selections.wrappedValue[component] = parent.horas[component][row]
        }
    }
}

