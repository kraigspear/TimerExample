//
//  ContentView.swift
//  TimerExample
//
//  Created by Kraig Spear on 7/15/23.
//

import SwiftUI

struct ContentView: View {
    
    // StateObject means this view owns the ViewModel, we don't have to worry about it getting destroyed if the view re-creates
    @StateObject private var timerViewModel = TimerViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Start") {
                timerViewModel.start()
            }
            Button("Stop") {
                timerViewModel.stop()
            }
            TickerView(viewModel: timerViewModel)
                .padding(.top)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
