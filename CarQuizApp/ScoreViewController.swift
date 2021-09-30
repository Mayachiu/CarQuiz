//
//  ScoreViewController.swift
//  CarQuizApp
//
//  Created by 内山和輝 on 2021/09/28.
//

import UIKit

class ScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var correct = 0
    
    var scoreCSVArray:[String] = []
    var scoreQuizArray:[String] = []
    
    var scoreQuizNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        scoreQuizNumber = scoreCSVArray.count

        scoreLabel.text = "\(correct)問正解！"
      
        print(scoreCSVArray)
        
        print(scoreCSVArray.count)
        
        
        print(scoreQuizArray)
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreQuizNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
        cell.scoreAnswerLabel.text = "正解は○です"
//        scoreQuizArray = scoreCSVArray[scoreQuizNumber - 1].components(separatedBy: ",")
        scoreQuizArray = scoreCSVArray[indexPath.row].components(separatedBy: ",")
        print(scoreQuizArray.count)
        print("aa")
        cell.scoreQuizTextView.text = scoreQuizArray[0]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "解答"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
    }
    
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func toSelectButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
        
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
