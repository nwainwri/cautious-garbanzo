//
//  ViewController.swift
//  CautiousGarbanzo
//
//  Created by Nathan Wainwright on 2018-09-13.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

  
  
  @IBOutlet weak var mainNavBar: UIView!
  @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var navBarPlusButton: UIButton!
  
  @IBOutlet weak var mainTableView: UITableView!
  
  var snacks:Array<String>!
  
  var properPath: IndexPath!
  
  
  var isVertical = false
  var myStack: UIStackView!
  
  var snackTitleLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //    self.navBarPlusButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
    // Do any additional setup after loading the view, typically from a nib.
    
    snacks = []
    
    // MARK: stackView
    let imageOne = UIImageView(image: #imageLiteral(resourceName: "oreos"))
    let imageTwo = UIImageView(image: #imageLiteral(resourceName: "pizza_pockets"))
    let imageThree = UIImageView(image: #imageLiteral(resourceName: "popsicle"))
    let imageFour = UIImageView(image: #imageLiteral(resourceName: "ramen"))
    let imageFive = UIImageView(image: #imageLiteral(resourceName: "pop_tarts"))
    
    //MARK: snackTitleLabel
//    let snackTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
////    snackTitleLabel.center = CGPoint(x: 160, y: 285)
//    snackTitleLabel.textAlignment = .center
//    snackTitleLabel.text = "SNACKS"
//    self.view.addSubview(label)

    
//    imageOne.heightAnchor.constraint(equalToConstant: 40) .isActive = true
//    imageTwo.heightAnchor.constraint(equalToConstant: 40) .isActive = true
//    imageThree.heightAnchor.constraint(equalToConstant: 40) .isActive = true
//    imageFour.heightAnchor.constraint(equalToConstant: 40) .isActive = true
//    imageFive.heightAnchor.constraint(equalToConstant: 40) .isActive = true
    
    snackTitleLabel = UILabel(frame: .zero)
    snackTitleLabel.text = "SNACKS"
    snackTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    mainNavBar.addSubview(snackTitleLabel)
//    snackTitleLabel.bottomAnchor.constraint(equalTo: mainNavBar.bottomAnchor, constant: -120).isActive = true
    snackTitleLabel.centerYAnchor.constraint(equalTo: mainNavBar.centerYAnchor, constant: -5).isActive = true
    snackTitleLabel.centerXAnchor.constraint(equalTo: mainNavBar.centerXAnchor).isActive = true
    
    
    myStack = UIStackView(arrangedSubviews: [imageOne, imageTwo, imageThree, imageFour, imageFive])
    
    myStack.translatesAutoresizingMaskIntoConstraints = false
    myStack.alignment = .center
    myStack.distribution = .fillProportionally
    myStack.axis = .horizontal
    mainNavBar.addSubview(myStack)
    
    
    
    
    myStack.heightAnchor.constraint(equalToConstant: 90) .isActive = true
    myStack.leadingAnchor.constraint(equalTo: mainNavBar.leadingAnchor, constant: 8) .isActive = true
    myStack.trailingAnchor.constraint(equalTo: mainNavBar.trailingAnchor, constant: -8) .isActive = true
    //    myStack.topAnchor.constraint(equalTo: mainNavBar.topAnchor, constant: 80) .isActive = true
    myStack.bottomAnchor.constraint(equalTo: mainNavBar.bottomAnchor, constant: -2) .isActive = true
    
    myStack.isHidden = true
    myStack.spacing = 5
    
    mainTableView.delegate = self
    mainTableView.dataSource = self
    
    let imageOneTap = UITapGestureRecognizer()
  
    imageOneTap.addTarget(self, action:#selector(imageOneTapped))
    imageOneTap.numberOfTouchesRequired = 1
    imageOneTap.numberOfTapsRequired = 1
    imageOne.addGestureRecognizer(imageOneTap)
    imageOne.isUserInteractionEnabled = true
    
    let imageTwoTap = UITapGestureRecognizer()
    
    imageTwoTap.addTarget(self, action:#selector(imageTwoTapped))
    imageTwoTap.numberOfTouchesRequired = 1
    imageTwoTap.numberOfTapsRequired = 1
    imageTwo.addGestureRecognizer(imageTwoTap)
    imageTwo.isUserInteractionEnabled = true
    
    let imageThreeTap = UITapGestureRecognizer()
    
    imageThreeTap.addTarget(self, action:#selector(imageThreeTapped))
    imageThreeTap.numberOfTouchesRequired = 1
    imageThreeTap.numberOfTapsRequired = 1
    imageThree.addGestureRecognizer(imageThreeTap)
    imageThree.isUserInteractionEnabled = true
    
    let imageFourTap = UITapGestureRecognizer()
    
    imageFourTap.addTarget(self, action:#selector(imageFourTapped))
    imageFourTap.numberOfTouchesRequired = 1
    imageFourTap.numberOfTapsRequired = 1
    imageFour.addGestureRecognizer(imageFourTap)
    imageFour.isUserInteractionEnabled = true
    
    let imageFiveTap = UITapGestureRecognizer()
    
    imageFiveTap.addTarget(self, action:#selector(imageFiveTapped))
    imageFiveTap.numberOfTouchesRequired = 1
    imageFiveTap.numberOfTapsRequired = 1
    imageFive.addGestureRecognizer(imageFiveTap)
    imageFive.isUserInteractionEnabled = true
    
    
    
    
    
    
    
    
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
    
    UIView.animate(withDuration: 0.5, animations: {
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
      
      if !self.myStack.isHidden {
        self.snackTitleLabel.text = "ADD A SNACK"
      } else {
        self.snackTitleLabel.text = "SNACKS"
      }
      }})
    //    print("button pressed")
  }
  
  
  //MARK: TAP GESTURE FUNCS
  @objc func imageOneTapped() {
    print("imageOneTapped")
    snacks.append("Oreos")
    print("TEST: \(snacks)")
    mainTableView.reloadData()
  }
  
  @objc func imageTwoTapped() {
    print("pizzapops ")
    let indexPath = IndexPath(row: snacks.count, section: 0)
    snacks.append("Pizza Pops")
    print("TEST: \(snacks)")
    // MARK: QUESTION mainTableView.insertRowsAtIndexPaths(properPath, withRowAnimation: UITableViewRowAnimation.bottom)
    //mainTableView.reloadData()
    mainTableView.insertRows(at: [indexPath], with: .automatic)
  }
  
  @objc func imageThreeTapped() {
    print("popsciles ")
    snacks.append("Popscicles")
    print("TEST: \(snacks)")
    mainTableView.reloadData()
  }
  
  @objc func imageFourTapped() {
    print("ramen ")
    snacks.append("Ramen")
    print("TEST: \(snacks)")
    mainTableView.reloadData()
  }
  
  @objc func imageFiveTapped() {
    print("poptars ")
    snacks.append("Poptarts")
    print("TEST: \(snacks)")
    mainTableView.reloadData()
  }
  
  
  //MARK: TABLE VIEW FUNCS
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return snacks.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = mainTableView.dequeueReusableCell(withIdentifier: "mainViewCell", for: indexPath)
    properPath = indexPath
    cell.textLabel?.text = snacks[indexPath.row]
    return cell
  }
  
  
}

