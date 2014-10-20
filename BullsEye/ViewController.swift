//
//  ViewController.swift
//  BullsEye
//
//  Created by sora on 18/10/14.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBAction func startOver(sender: AnyObject) {
        startNewGame()
        updateLabels()
    }
    
    @IBAction func showAlert() {
        var difference: Int = abs(currentValue - targetValue)
        var points = 100 - difference
        
        var title: String
        if difference == 0 {
            points += 100
            title = "Perfect!"
        }else if difference < 5 {
            points += 50
            title = "You almost had it!"
        }else if difference < 10 {
            title = "Pretty good!"
        }else {
            points -= 100
            title = "Not even close..."
        }
        
        score += points
        let message = "The scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "OK", style: .Default,
            handler: {
                action in
                self.startNewRound()
                self.updateLabels()
        })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startNewRound() {
        round++
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
}

