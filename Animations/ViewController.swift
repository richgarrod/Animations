//
//  ViewController.swift
//  Animations
//
//  Created by Richard Garrod on 20/08/2015.
//  Copyright (c) 2015 RichardGarrod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var origHeight : CGFloat?
    var origWidth: CGFloat?
    var counter = 0
    
    var timer = NSTimer()
    
    @IBOutlet var llama: UIImageView!
    
    func moveOn() {
        
        if (counter == 16) {
            counter = 1
        }
        else {
            counter++
        }
        
        llama.image = UIImage(named: "llama\(counter).png")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        origHeight = llama.frame.height
        origWidth = llama.frame.width
        

        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("moveOn"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        llama.frame = CGRectMake(llama.center.x - (llama.frame.width / 2), llama.center.y  - (llama.frame.height / 2), 0, 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.llama.frame = CGRectMake(self.llama.center.x, self.llama.center.y, self.origWidth!, self.origHeight!)
        })
    }


}

