//
//  TipCalculatorModel.swift
//  MyToDo
//
//  Created by El Capitan on 2015/11/04.
//  Copyright © 2015年 Junichi Tsurukawa. All rights reserved.
//

import Foundation

class TipCalculatorModel {
  
  var total: Double
  var taxPct: Double
  var subtotal: Double {
    get {
      return total/(taxPct + 1)
    }
    set {
      NSLog("subtotal is set: %f", newValue)
    }
  }


  init(total: Double, taxPct: Double) {
    self.total = total
    self.taxPct = taxPct
  }
  
  func calcTipWithTipPct(tipPct: Double) -> Double {
    return subtotal * tipPct
  }
  
  func printPossibleTips() {
    print("15%: \(calcTipWithTipPct(0.15))")
    print("18%: \(calcTipWithTipPct(0.18))")
    print("20%: \(calcTipWithTipPct(0.20))")
  }
  
}