//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = [
        "Soft": 3, "Medium": 4, "Hard": 7
    ]
    
    var secondsRemaining = 60
    
    var timer = Timer()

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func pressEgg(_ sender: UIButton) {
        timer.invalidate()
        timerLabel.text = "Egg cooking!"
        
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds until your egg is done.")
            secondsRemaining -= 1
        }
        if secondsRemaining == 0 {
            timer.invalidate()
            timerLabel.text = "Done!!!"
        }
    }
}
