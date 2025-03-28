//
//  ContentView.swift
//  TomatoTimer
//
//  Created by Logan  Jackson on 3/28/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timerManager = TimerManager()
    
    var body: some View {
        VStack (spacing: 20) {
            Text("Tomato Timer 🍅")
                .font(.largeTitle)
                .padding()
            
            Text(timeString(from: timerManager.timeRemaining))
                .font(.system(size: 48, weight: .bold, design: .monospaced))
            
            HStack {
                Button("Start") {
                    timerManager.startTimer()
                }
                Button("Stop") {
                    timerManager.stopTimer()
                }
                Button("Reset") {
                    timerManager.resetTimer()
                }
            }
            .padding()
        }
    }
    
    func timeString(from seconds: Int) -> String {
        let min = seconds / 60
        let sec = seconds % 60
        
        return String(format: "%02d:%02d", min, sec)
    }
}

#Preview {
    ContentView()
}
