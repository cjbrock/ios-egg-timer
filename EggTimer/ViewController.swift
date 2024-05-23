//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12

    @IBAction func pressEgg(_ sender: UIButton) {
        let hardness = sender.currentTitle
        switch hardness {
        case "Soft":
            cookEgg(eggTime: softTime)
        case "Medium":
            cookEgg(eggTime: mediumTime)
        case "Hard":
            cookEgg(eggTime: hardTime)
        default:
            print("Error")
        }
    }
    
    func cookEgg(eggTime: Int){
        print(eggTime)
    }
}
