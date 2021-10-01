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
    var scoreQuizImageArray:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("以下Score画面----------------------")
        print("csv")
        print(scoreCSVArray)
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        scoreQuizNumber = scoreCSVArray.count
        scoreLabel.text = "\(correct)問正解！"
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreQuizNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
        scoreQuizArray = scoreCSVArray[indexPath.row].components(separatedBy: ",")
        print("quiz")
        print(scoreQuizArray)
        
        cell.scoreQuizNunberLabel.text = "第\(indexPath.row + 1)問"
        cell.scoreQuizImageView.image = scoreQuizImageArray[indexPath.row]
        
        if scoreQuizArray[1] == "1" {
            cell.scoreAnswerLabel.text = "正解は\(scoreQuizArray[2])です"
        } else if scoreQuizArray[1] == "2" {
            cell.scoreAnswerLabel.text = "正解は\(scoreQuizArray[3])です"
        }
        
        cell.scoreQuizTextView.text = scoreQuizArray[0]
        cell.explanation.text = scoreQuizArray[4]
        
        cell.scoreQuizTextView.isScrollEnabled = false
        cell.explanation.isScrollEnabled = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "解答"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 180
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
