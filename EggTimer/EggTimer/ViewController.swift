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

//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    var tempoTotal = 0
    var segundosPassados = 0
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        //    print(sender.currentTitle)
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        tempoTotal = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        segundosPassados = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
   
    
    @objc func updateTimer(){
        if segundosPassados < tempoTotal
        {
            segundosPassados += 1
            progressBar.progress = Float(segundosPassados) / Float(tempoTotal)
                print(Float(segundosPassados) / Float(tempoTotal))
            
        }
        else
        {
            timer.invalidate()
            titleLabel.text = "CONCLUIDO"
            
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url! )
            player.play()
       
        }

    }
   
}

        //let result = eggTimes[hardness]!
        //print(result)
        //let hardness = sender.currentTitle
//        if hardness == "Soft"
//        {
//            print(softTime)
//        }
//        else if hardness == "Medium"
//        {
//            print(mediumTime)
//        }
//        else
//        {
//            print(hardTime)
//        }
//        let hardness = sender.currentTitle
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Error")
//        }
        
      

