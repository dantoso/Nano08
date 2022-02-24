//
//  TimerView.swift
//  Peptobismol
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/22.
//

import SwiftUI

struct TimerView: View {
    @State var currentDate = Date()
    
    //common: Deixa o processo em loop
    //autonnect: Se conecta automaticamente ao seu editor conectável upstream.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("\(currentDate)")
            .onReceive(timer) { input in
                currentDate = input
            }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
