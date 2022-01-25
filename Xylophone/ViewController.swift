import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        if let buttonText = sender.titleLabel!.text {
            playSound(soundName: buttonText)
            
            sender.alpha = 0.5
            
            /*
             Dispatch: システムが管理しているDispatchQueueに作業を送信することで、複数の処理を同時に行うためのフレームワーク。
             メインスレッドにキューを作成し、コードブロック内の処理を指定の時間（0.2秒後）に実行する非同期処理を実装
             */
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                sender.alpha = 1.0
            }
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
}

