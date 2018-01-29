//
//  ViewController.swift
//  BullzEye2
//
//  Created by Admin on 1/14/18.
//  Copyright © 2018 Matthew Heinrichs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundsLabel: UILabel!
    
    
    var targetValue: Int = 0
    var currentValue: Int = 0
    var score = 0
    var round = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = "\(score)"
        roundsLabel.text = "\(round)"
        
    }
    
    func startNewRound() {
        
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        round += 1
    }
    
    func starOver() {
        score = 0
        round = 1
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
       // print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
        
    }

    @IBAction func showAlert() {
        
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "Almost Got It!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty Good."
        } else {
            title = "Keep Trying..."
        }
        
        score += points
        
        let message = "You scored \(points) points!"
        
        let alert = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
                self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func startOverButton(_ sender: Any) {
        
        starOver()
    }
}

