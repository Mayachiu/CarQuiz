//
//  SelectLevelViewController.swift
//  CarQuizApp
//
//  Created by 内山和輝 on 2021/09/28.
//

import UIKit

class SelectLevelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func levelButtonAction(sender: UIButton) {
        print(sender.tag)
        performSegue(withIdentifier: "toQuizVC", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
