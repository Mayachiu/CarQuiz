//
//  ViewController.swift
//  CarQuizApp
//
//  Created by 内山和輝 on 2021/09/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var contactButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 30.0
        contactButtonLabel.layer.cornerRadius = 20.0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func contactButtonAction(_ sender: Any) {
        let url = URL(string: "https://forms.gle/nGae1HGbHEoqZPio6")
        UIApplication.shared.open(url!)
    }
    
}

