//
//  ViewController.swift
//  BullsEye
//
//  Created by sora on 18/10/14.
//  Copyright (c) 2014年 sora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello, World", message: "This is my first app!", preferredStyle: UIAlertControllerStyle.Alert)
        
        let action = UIAlertAction(title: "Awesome", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

