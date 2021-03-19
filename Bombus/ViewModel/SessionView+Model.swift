//
//  SessionTimerViewModel.swift
//  Bombus
//
//  Created by Yon Montoto on 3/10/21.
//

import Foundation

extension SessionView {
    class ViewModel: ObservableObject {

        @Published private(set) var sessionTimer: SessionTimer
        let formatter = DateComponentsFormatter()

        var timerDuration: Double { return sessionTimer.duration }
        
        var currentTimerString: String { formatter.string(from: timerDuration) ?? "Nothing"}

        init() {
            // once the user can select the time intervals we will change the hardcoded value to the configuration one.
            sessionTimer = SessionTimer(duration: 1500.0, start: nil)
            setupFormatter()
        }

        func startTimer() {
            sessionTimer.start = Date.init(timeInterval: 1500, since: Date())
            beginDurationCounter(at: sessionTimer.start!)
        }

        private func setupFormatter() {
            formatter.unitsStyle = .positional
            formatter.allowedUnits = [.minute, .second ]
            formatter.zeroFormattingBehavior = [ .pad ]
        }

        // Bugged and only works because i glued it together. Just proof of concept.
        private func beginDurationCounter(at date: Date) {
            sessionTimer.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                guard self.sessionTimer.duration != 0 else {
                    timer.invalidate()
                    return
                }
                self.sessionTimer.duration -= 1.0
            }
            // RunLoop seems to address memory issue. Need to work on edgecase checks
            RunLoop.main.add(sessionTimer.timer, forMode: .common)
        }

    }
}
