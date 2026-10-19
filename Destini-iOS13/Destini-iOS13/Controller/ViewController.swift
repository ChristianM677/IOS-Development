//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var storyBrain = StoryBrain()
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    override func viewDidLoad() {
        updateUI()
        super.viewDidLoad()
    }
  
    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(choice: sender.currentTitle!) //The function that triggers to go to next story depending on button clicked
        updateUI()
    }
    
    func updateUI(){
        storyLabel.text = storyBrain.getStoryTitle()
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
}
