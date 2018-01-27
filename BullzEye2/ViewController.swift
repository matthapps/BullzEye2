//
//  ViewController.swift
//  BullzEye2
//
//  Created by Admin on 1/14/18.
//  Copyright © 2018 Matthew Heinrichs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    var targetValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
    }
    
    func startNewRound() {
        
        targetValue = Int(1 + arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
        
    }

    @IBAction func showAlert() {
        
        let message = "The current value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hit Me!", message: 
            message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
}

