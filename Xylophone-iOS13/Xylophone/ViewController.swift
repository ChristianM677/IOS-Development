//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import UIKit
import AVFoundation //Modules from apple that help with adding more versatility. This module helps with our code working with the devices audio and camera hardware

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        sender.alpha = 0.5 //The .alpha represents the transperecy of UI elements in apple. Will make the button opace by 50%

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { //"Disaptch Queue manages the execution of a series of tasks. The main... is the method that schedules an execution at a specific time and returns it at a specific time
              //Bring's sender's opacity back up to fully opaque.
        sender.alpha = 1.0
        
        }
    }
    
    func playSound(soundName: String) {
        
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")//A url being declared which will bundle our resource/file (C) and with extension "wav".
        player = try! AVAudioPlayer(contentsOf: url!) //player will grab the url we declared which has our audio we want to play
        player.play()
                
    }
}


