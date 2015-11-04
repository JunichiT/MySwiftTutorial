//
//  ViewController.swift
//  MyToDo
//
//  Created by El Capitan on 2015/11/04.
//  Copyright © 2015年 Junichi Tsurukawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var totalTextField: UITextField!
  @IBOutlet var taxPctSlider: UISlider!
  @IBOutlet var taxPctLabel: UILabel!
  @IBOutlet var resultsTextView: UITextView!
  
  let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    refleshUI()
  }
  
  func refleshUI() {
    totalTextField.text = String(format: "%0.2f", tipCalc.total)
    taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
    taxPctLabel.text = "Tax Percentage(\(Int(taxPctSlider.value))%)"
    resultsTextView.text = ""
  }

  @IBAction func calculateTapped(sender: AnyObject) {
    tipCalc.total = Double((totalTextField.text! as NSString).doubleValue)
    
    let possibelTips = tipCalc.returnPossibleTips()
    var results = ""
    
    for (tipPct, tipValue) in possibelTips {
      results += "\(tipPct)%: \(tipValue)\n"
    }
    
    resultsTextView.text = results
  }
  
  @IBAction func taxPercentageChanged(sender: AnyObject) {
    tipCalc.taxPct = Double(taxPctSlider.value)/100.0
    refleshUI()
  }
  
  @IBAction func viewTapped(sender: AnyObject) {
    totalTextField.resignFirstResponder()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

