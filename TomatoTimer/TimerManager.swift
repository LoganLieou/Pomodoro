import SwiftUI
import AVFoundation

class TimerManager : ObservableObject {
    @Published var timeRemaining : Int = 1500 // 25 min
    var timer : Timer?
    var player : AVAudioPlayer?
    
    func startTimer() {
        self.timer?.invalidate();
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self  = self else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
            else {
                self.timer?.invalidate()
                self.playSound()
            }
            
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func resetTimer() {
        timer?.invalidate()
        timeRemaining = 1500
    }
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "beep", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
