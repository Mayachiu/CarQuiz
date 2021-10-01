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
    @IBOutlet weak var toTopButton: UIButton!
    @IBOutlet weak var toSelectLevelButton: UIButton!
    
    var correct = 0
    var scoreCSVArray:[String] = []
    var scoreQuizArray:[String] = []
    var scoreQuizNumber = 0
    var scoreSelectLabel = 0
    var scoreQuizImageArray1:[UIImage] = []
    var scoreQuizImageArray2:[UIImage] = []
    var scoreQuizImageArray3:[UIImage] = []
    var scoreQuizImageArray4:[UIImage] = []
    var scoreQuizImageArray5:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toTopButton.layer.cornerRadius = 20.0
        toSelectLevelButton.layer.cornerRadius = 20.0
//        print("以下Score画面----------------------")
//        print("csv")
//        print(scoreCSVArray)
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
//        print("quiz")
//        print(scoreQuizArray)
        
        cell.scoreQuizTextView.layer.cornerRadius = 5.0
        
        cell.scoreQuizNunberLabel.text = "第\(indexPath.row + 1)問"
        
        if scoreSelectLabel == 1 {
            cell.scoreQuizImageView.image = scoreQuizImageArray1[indexPath.row]
        } else if scoreSelectLabel == 2 {
            cell.scoreQuizImageView.image = scoreQuizImageArray2[indexPath.row]
        } else if scoreSelectLabel == 3 {
            cell.scoreQuizImageView.image = scoreQuizImageArray3[indexPath.row]
        } else if scoreSelectLabel == 4 {
            cell.scoreQuizImageView.image = scoreQuizImageArray4[indexPath.row]
        } else if scoreSelectLabel == 5 {
            cell.scoreQuizImageView.image = scoreQuizImageArray5[indexPath.row]
        }
       
        
        if scoreQuizArray[1] == "1" {
            cell.scoreAnswerLabel.text = "正解は\(scoreQuizArray[2])です。"
        } else if scoreQuizArray[1] == "2" {
            cell.scoreAnswerLabel.text = "正解は\(scoreQuizArray[3])です。"
        }
        
        cell.scoreQuizTextView.text = "問題: \(scoreQuizArray[0])"
        cell.explanation.text = "解説: \(scoreQuizArray[4])"
        
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            // 背景色を変更する
            view.tintColor = UIColor(hex: "F3F0D7")
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

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}
