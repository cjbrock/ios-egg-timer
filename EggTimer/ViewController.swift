//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = [
        "Soft": 3, "Medium": 4, "Hard": 7
    ]
    
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    var player: AVAudioPlayer!

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func pressEgg(_ sender: UIButton) {
    
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timerLabel.text = "\(hardness) egg cooking!"
        
        progressBar.progress = 0.0
        secondsPassed = 0
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
     
        } else  {
            timer.invalidate()
            timerLabel.text = "Done!!!"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
