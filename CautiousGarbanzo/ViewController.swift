//
//  ViewController.swift
//  CautiousGarbanzo
//
//  Created by Nathan Wainwright on 2018-09-13.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var mainNavBar: UIView!
  @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.


  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  @IBAction func navBarPlusButtonPressed(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
//    sender.adjustsImageWhenHighlighted = false
    
    
    sender.adjustsImageWhenHighlighted = false
    
    // myButton.setImage(UIImage(named : "unselectedImage"), forState: UIControlState.Normal)
    
    UIView.animate(withDuration: 0.5, animations: {
      let newHeight:CGFloat = sender.isSelected ? 200 : 64
            self.navBarHeightConstraint.constant = newHeight // heightCon is the IBOutlet to the constraint
      self.view.layoutIfNeeded()
    })

    print("button pressed")
  }
  
  
  
  
  
  
  
  
}

