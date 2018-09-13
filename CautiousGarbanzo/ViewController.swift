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
  @IBOutlet weak var navBarPlusButton: UIButton!
  
  var isVertical = false
  var myStack: UIStackView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //    self.navBarPlusButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // MARK: testStack
    //    let heightConstraintA = a.heightAnchor.constraint(equalToConstant: 120.0)
    
//    let buttonOne = UIButton(type: .system)
//    buttonOne.setTitle("ONE", for: .normal)
//
//    let buttonTwo = UIButton(type: .system)
//    buttonTwo.setTitle("TWO", for: .normal)
//
//    let buttonThreee = UIButton(type: .system)
//    buttonThreee.setTitle("THREE", for: .normal)
    

    
    let imageOne = UIImageView(image: #imageLiteral(resourceName: "oreos"))
    let imageTwo = UIImageView(image: #imageLiteral(resourceName: "pizza_pockets"))
    let imageThree = UIImageView(image: #imageLiteral(resourceName: "popsicle"))
    let imageFour = UIImageView(image: #imageLiteral(resourceName: "ramen"))
    let imageFive = UIImageView(image: #imageLiteral(resourceName: "pop_tarts"))
    
    
    // The didTap: method will be defined in Step 3 below.
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(sender:)))
    
    // Optionally set the number of required taps, e.g., 2 for a double click
    tapGestureRecognizer.numberOfTapsRequired = 2
    
    // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
    imageOne.isUserInteractionEnabled = true
    imageOne.addGestureRecognizer(tapGestureRecognizer)
    
    
    
    
    
//    let myStack = UIStackView(arrangedSubviews: [buttonOne, buttonTwo, buttonThreee])
    
    myStack = UIStackView(arrangedSubviews: [imageOne, imageTwo, imageThree, imageFour, imageFive])
    
    myStack.translatesAutoresizingMaskIntoConstraints = false
    myStack.alignment = .center
    myStack.distribution = .fillProportionally
    myStack.axis = .horizontal
    mainNavBar.addSubview(myStack)
    
    imageOne.isUserInteractionEnabled = true

    
    myStack.heightAnchor.constraint(equalToConstant: 100) .isActive = true
    myStack.leadingAnchor.constraint(equalTo: mainNavBar.leadingAnchor, constant: 8) .isActive = true
    myStack.trailingAnchor.constraint(equalTo: mainNavBar.trailingAnchor, constant: -8) .isActive = true
//    myStack.topAnchor.constraint(equalTo: mainNavBar.topAnchor, constant: 80) .isActive = true
    myStack.bottomAnchor.constraint(equalTo: mainNavBar.bottomAnchor, constant: -8) .isActive = true
    
    myStack.isHidden = true
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  @IBAction func navBarPlusButtonPressed(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
    sender.adjustsImageWhenHighlighted = false
    
    //    self.navBarPlusButton.imageView?.transform = self.navBarPlusButton.transform.rotated(by: CGFloat(Double.pi / 2))
    
    //    self.navBarPlusButton.transform = self.navBarPlusButton.transform.rotated(by: CGFloat(M_PI_2))
    
    //    sender.transform =  CGAffineTransform(rotationAngle: CGFloat.pi)
    //    sender.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    
    let customView = sender
    let transform: CGAffineTransform = isVertical ? .identity : CGAffineTransform(rotationAngle:  CGFloat.pi/4)
    
    UIView.animate(withDuration: 1, animations: {
      customView.transform =  transform
    }, completion: { (finished) in
      self.isVertical = !self.isVertical
    })
    
    //    let originalTransform = self.navBarPlusButton.transform
    //    let rotateTransform = originalTransform.rotated(by:)
    //    UIView.animate(withDuration: 0.7, animations: {
    //      self.navBarPlusButton.transform = rotateTransform
    //    })
    
    
    //    // change size
    //    UIView.animate(withDuration: 0.5, animations: {
    //      let newHeight:CGFloat = sender.isSelected ? 200 : 64
    //            self.navBarHeightConstraint.constant = newHeight // heightCon is the IBOutlet to the constraint
    //      self.view.layoutIfNeeded()
    //    })
    
    // springy
    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 8, options: .curveEaseInOut, animations: {do {
      let newHeight:CGFloat = sender.isSelected ? 200 : 64
      self.navBarHeightConstraint.constant = newHeight // heightCon is the IBOutlet to the constraint
      self.view.layoutIfNeeded()
      self.myStack.isHidden = !sender.isSelected
      }})
//    print("button pressed")
  }
  
  
  
  
  
  
  
  //MARK: custom funcs
  @objc func didTap(sender: UITapGestureRecognizer) {
    let location = sender.location(in: view)
    // User tapped at the point above. Do something with that if you want.
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}

