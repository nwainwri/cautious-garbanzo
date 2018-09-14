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
  var snackStackView: UIStackView!
  var snackTitleLabel: UILabel!
  
  var snacks:Array<String>! = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // MARK: snackStackView
    let imageOneView = UIImageView(image: #imageLiteral(resourceName: "oreos"))
    let imageTwoView = UIImageView(image: #imageLiteral(resourceName: "pizza_pockets"))
    let imageThreeView = UIImageView(image: #imageLiteral(resourceName: "popsicle"))
    let imageFourView = UIImageView(image: #imageLiteral(resourceName: "ramen"))
    let imageFiveView = UIImageView(image: #imageLiteral(resourceName: "pop_tarts"))
    
    // MARK: height/widgths for imageViews
    //stops image views from getting weirdly distorted in either portrait or landscape
    imageOneView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    imageOneView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    
    imageTwoView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    imageTwoView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    
    imageThreeView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    imageThreeView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    
    imageFourView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    imageFourView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    
    imageFiveView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    imageFiveView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    
    
    
    snackTitleLabel = UILabel(frame: .zero)
    snackTitleLabel.text = "SNACKS"
    snackTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    mainNavBar.addSubview(snackTitleLabel)
    snackTitleLabel.centerYAnchor.constraint(equalTo: mainNavBar.centerYAnchor, constant: -5).isActive = true
    snackTitleLabel.centerXAnchor.constraint(equalTo: mainNavBar.centerXAnchor).isActive = true
    
    
    snackStackView = UIStackView(arrangedSubviews: [imageOneView, imageTwoView, imageThreeView, imageFourView, imageFiveView])
    
    snackStackView.translatesAutoresizingMaskIntoConstraints = false
    snackStackView.alignment = .center
    snackStackView.distribution = .equalSpacing
    snackStackView.axis = .horizontal
    mainNavBar.addSubview(snackStackView)
    
    
    //MARK: BUG ISSUE -- how the stack is displayed width wise and along the title.
    // would probably pin them all to the side, as it looks tidier
    snackStackView.heightAnchor.constraint(equalToConstant: 90).isActive = true
//    snackStackView.widthAnchor.constraint(equalToConstant: 220).isActive = true
    snackStackView.leadingAnchor.constraint(equalTo: mainNavBar.leadingAnchor, constant: 28).isActive = true
    snackStackView.trailingAnchor.constraint(equalTo: mainNavBar.trailingAnchor, constant: -28).isActive = true
    snackStackView.bottomAnchor.constraint(equalTo: mainNavBar.bottomAnchor, constant: -2).isActive = true
    
    snackStackView.isHidden = true
//    snackStackView.spacing = 5
    
    mainTableView.delegate = self
    mainTableView.dataSource = self
    
    // MARK: tap gestures
    let imageOneTap = UITapGestureRecognizer()
    imageOneTap.addTarget(self, action:#selector(imageOneTapped))
    imageOneTap.numberOfTouchesRequired = 1
    imageOneTap.numberOfTapsRequired = 1
    imageOneView.addGestureRecognizer(imageOneTap)
    imageOneView.isUserInteractionEnabled = true
    
    let imageTwoTap = UITapGestureRecognizer()
    imageTwoTap.addTarget(self, action:#selector(imageTwoTapped))
    imageTwoTap.numberOfTouchesRequired = 1
    imageTwoTap.numberOfTapsRequired = 1
    imageTwoView.addGestureRecognizer(imageTwoTap)
    imageTwoView.isUserInteractionEnabled = true
    
    let imageThreeTap = UITapGestureRecognizer()
    imageThreeTap.addTarget(self, action:#selector(imageThreeTapped))
    imageThreeTap.numberOfTouchesRequired = 1
    imageThreeTap.numberOfTapsRequired = 1
    imageThreeView.addGestureRecognizer(imageThreeTap)
    imageThreeView.isUserInteractionEnabled = true
    
    let imageFourTap = UITapGestureRecognizer()
    imageFourTap.addTarget(self, action:#selector(imageFourTapped))
    imageFourTap.numberOfTouchesRequired = 1
    imageFourTap.numberOfTapsRequired = 1
    imageFourView.addGestureRecognizer(imageFourTap)
    imageFourView.isUserInteractionEnabled = true
    
    let imageFiveTap = UITapGestureRecognizer()
    imageFiveTap.addTarget(self, action:#selector(imageFiveTapped))
    imageFiveTap.numberOfTouchesRequired = 1
    imageFiveTap.numberOfTapsRequired = 1
    imageFiveView.addGestureRecognizer(imageFiveTap)
    imageFiveView.isUserInteractionEnabled = true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func navBarPlusButtonPressed(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
    sender.adjustsImageWhenHighlighted = false
    
    let transform: CGAffineTransform = sender.isSelected ? CGAffineTransform(rotationAngle:  CGFloat.pi/4) : .identity
    let newHeight:CGFloat = sender.isSelected ? 200 : 64
    let snackTilte = self.snackStackView.isHidden ? "ADD A SNACK" : "SNACKS"
    
    UIView.animate(withDuration: 0.5, animations: {
      sender.transform =  transform
    })
    
    // SPRING ANIMATION FOR NAV BAR
    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 8, options: .curveEaseInOut, animations: {do {
      self.navBarHeightConstraint.constant = newHeight
      self.view.layoutIfNeeded()
      self.snackStackView.isHidden = !sender.isSelected
      self.snackTitleLabel.text = snackTilte
    }})
  }
  
  //MARK: TAP GESTURE FUNCS
  @objc func imageOneTapped() {
    let indexPath = IndexPath(row: snacks.count, section: 0)
    snacks.append("Oreos")
    mainTableView.insertRows(at: [indexPath], with: .automatic)
  }
  
  @objc func imageTwoTapped() {
    let indexPath = IndexPath(row: snacks.count, section: 0)
    snacks.append("Pizza Pops")
    mainTableView.insertRows(at: [indexPath], with: .automatic)
  }
  
  @objc func imageThreeTapped() {
    let indexPath = IndexPath(row: snacks.count, section: 0)
    snacks.append("Popscicles")
    mainTableView.insertRows(at: [indexPath], with: .automatic)
  }
  
  @objc func imageFourTapped() {
    let indexPath = IndexPath(row: snacks.count, section: 0)
    snacks.append("Ramen")
    mainTableView.insertRows(at: [indexPath], with: .automatic)
  }
  
  @objc func imageFiveTapped() {
    let indexPath = IndexPath(row: snacks.count, section: 0)
    snacks.append("Poptarts")
    mainTableView.insertRows(at: [indexPath], with: .automatic)
  }
  
  
  //MARK: TABLE VIEW FUNCS
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return snacks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = mainTableView.dequeueReusableCell(withIdentifier: "mainViewCell", for: indexPath)
    cell.textLabel?.text = snacks[indexPath.row]
    return cell
  }
  
  
}

