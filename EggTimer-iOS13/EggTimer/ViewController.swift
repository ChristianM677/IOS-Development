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
    
    @IBOutlet weak var timerBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 300, "Medium": 420,"Hard": 720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timerBar.progress = 1.0
        timer.invalidate()//Will invalidate our timer if we press another eggtime and start counting again
        
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        
        
        let result = eggTimes[hardness]!//The optional (!) would assure swift that our eggtime option will always display a value and not a nil
        totalTime = result
        timerBar.progress = 0.0 //Will reset bar to 0
        secondsPassed = 0 // Will reset our seconds to 0 when new button is pressed
        titleLabel.text = hardness //Will display the type of egg being counted
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        // The (selector) is calling an old function from objc which is why it tells us to add the @objc.
    }
    var player: AVAudioPlayer!
    func playSound() {
        
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")//A url being declared which will bundle our resource/file and end with mp3
        player = try! AVAudioPlayer(contentsOf: url!) //player will grab the url we declared which has our audio we want to play
        player.play()
                
    }
       @objc func updateTimer(){
            if secondsPassed < totalTime { //secondsPassed (0) is less than totalTime (300) add 1 everytime till its not anymore
                secondsPassed += 1
                let percentageProgress = Float(secondsPassed) / Float(totalTime)
            } else {
                timer.invalidate()
                titleLabel.text = "DONE!"
                playSound()
                timerBar.progress = 1.0
            }
        }
        
}
    
    

