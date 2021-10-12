//
//  SelectLevelViewController.swift
//  CarQuizApp
//
//  Created by 内山和輝 on 2021/09/28.
//

import UIKit

class SelectLevelViewController: UIViewController {

    @IBOutlet weak var levelButton1: UIButton!
    @IBOutlet weak var levelButton2: UIButton!
    @IBOutlet weak var levelButton3: UIButton!
    @IBOutlet weak var levelButton4: UIButton!
    @IBOutlet weak var levelButton5: UIButton!
    @IBOutlet weak var toTopButton: UIButton!
    
    var selectTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        levelButton1.layer.cornerRadius = 20.0
        levelButton2.layer.cornerRadius = 20.0
        levelButton3.layer.cornerRadius = 20.0
        levelButton4.layer.cornerRadius = 20.0
        levelButton5.layer.cornerRadius = 20.0
        toTopButton.layer.cornerRadius = 20.0
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizVC = segue.destination as! QuizViewController
        quizVC.selectLebel = selectTag
    }
    
    @IBAction func levelButtonAction(sender: UIButton) {
        print(sender.tag)
        selectTag = sender.tag
        performSegue(withIdentifier: "toQuizVC", sender: nil)
    }
    
    @IBAction func toTopButtonActionSub(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
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
