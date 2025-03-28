//
//  TomatoTimerApp.swift
//  TomatoTimer
//
//  Created by Logan  Jackson on 3/28/25.
//

import SwiftUI

@main
struct TomatoTimerApp: App {
    var body: some Scene {
        MenuBarExtra("Menu Bar Example", systemImage: "timer") {
            ContentView()
                .frame(width: 300, height: 300)
        }
        .menuBarExtraStyle(.window)
    }
}
