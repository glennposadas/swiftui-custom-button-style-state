//
//  ViewController.swift
//  Test
//
//  Created by Glenn Posadas on 2/3/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
  }
  
  @IBAction func showz(_ sender: Any) {
    let vc = UIHostingController(rootView: SwiftUIViewz())
    vc.modalPresentationStyle = .fullScreen
    navigationController?.present(vc, animated: true)
  }
  
}
