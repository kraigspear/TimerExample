//
//  TimerViewModel.swift
//  TimerExample
//
//  Created by Kraig Spear on 7/15/23.
//

import Foundation

@MainActor
final class TimerViewModel: ObservableObject {
    
    // MARK: - Properties
    
    // Using current, auto might be ok, but it's unlikely that someone will change their calendar
    private let calendar = Calendar.current
    
    /// The date we're counting down to
    private let eventDate: Date
    /// Task of the sleep/timer needed to cancel
    private var timerTask: Task<Void, Never>?
    
    // MARK: - Published
    
    // We only need to set internally
    @Published private (set) var ticker: Ticker?
    
    // MARK: - Actions
    
    func start() {
        timerTask = Task {
            updateDate()
              
            var timerActive = true
            
            repeat {
                do {
                    try await Task.sleep(for: .seconds(1))
                    updateDate()
                } catch {
                   timerActive = false
                }
            } while timerActive
        }
    }
    
    func stop () {
        timerTask?.cancel()
        timerTask = nil
    }
    
    // Since the ViewModel is a MainActor this will run on the MainThread.
    private func updateDate() {
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: Date(), to: eventDate)
        self.ticker = .init(dateComponents: components)
    }
    
    // MARK: - Init
    
    init(eventDate: Date = Calendar.current.date(byAdding: .day, value: 7, to: Date())!) {
        self.eventDate = eventDate
    }
    
    deinit {
        timerTask?.cancel()
    }
    
}
