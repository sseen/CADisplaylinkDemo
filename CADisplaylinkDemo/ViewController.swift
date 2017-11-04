//
//  ViewController.swift
//  CADisplaylinkDemo
//
//  Created by sseen on 2017/11/4.
//  Copyright © 2017年 sseen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    var displaylink:CADisplayLink!
    var content = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblName.text = "\(content)"
        self.displaylink = CADisplayLink(target: self, selector: #selector(updateText) )
        displaylink.preferredFramesPerSecond = 1
        //displaylink.frameInterval = 1
        //displaylink.isPaused = true
        displaylink.add(to: RunLoop.current, forMode: .commonModes)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func updateText() {
        content += 1
        lblName.text = "\(content)"
    }
    
    func startAnimation() {
        content += 100
        //displaylink.isPaused = false
    }
    
    func stopAnimation() {
        displaylink.isPaused = true
        displaylink.invalidate()
    }

    @IBAction func ck(_ sender: Any) {
        self.startAnimation()
    }
}

