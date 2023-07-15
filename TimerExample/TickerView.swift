//
//  TickerView.swift
//  TimerExample
//
//  Created by Kraig Spear on 7/15/23.
//

import SwiftUI

struct TickerView: View {
    
    // We don't own it (StateObject), we observe it.
    // Note: We usually would have 1 ViewModel per view, but there's nothing wrong with passing VM's around
    // or even have ViewModels members of other ViewModels.
    @ObservedObject private var viewModel: TimerViewModel
    
    init(viewModel: TimerViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Countdown to the Coast Guard Festal")
            Text(viewModel.ticker?.description ?? "")
        }
    }
}

struct TickerView_Previews: PreviewProvider {
    static var previews: some View {
        TickerView(viewModel: TimerViewModel())
    }
}
