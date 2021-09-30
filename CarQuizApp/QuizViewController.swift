//
//  QuizViewController.swift
//  CarQuizApp
//
//  Created by 内山和輝 on 2021/09/28.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var judgeImageView: UIImageView!
    @IBOutlet weak var quizImageView: UIImageView!
    
    let quizImageArray = [#imageLiteral(resourceName: "q1.png"), #imageLiteral(resourceName: "q2.png")]
    
    
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    var correctCount = 0
    var selectLebel = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("選択したのはレベル\(selectLebel)")
        quizImageView.image = quizImageArray[0]
        
        csvArray = loadCSV(fileName: "quiz\(selectLebel)")
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        print("csvです")
        print(csvArray)
        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        // Do any additional setup after loading the view.
    }
    
    //画面遷移するときにコードを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
       
        scoreVC.scoreCSVArray = csvArray
        scoreVC.scoreQuizArray = quizArray
        
    }
    
    @IBAction func btnAction(sender: UIButton) {
        if sender.tag == Int(quizArray[1]) {
            correctCount += 1
            print("正解")
            judgeImageView.image = UIImage(named: "correct")
        } else {
            print("不正解")
            judgeImageView.image = UIImage(named: "incorrect")
        }
        judgeImageView.isHidden = false
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        print("スコア:\(correctCount)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.judgeImageView.isHidden = true
            self.answerButton1.isEnabled = true
            self.answerButton2.isEnabled = true
            self.nextQuiz()
        }
        
    }
    
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("エラー")
        }
        return csvArray
    }
    
    func nextQuiz() {
        quizCount += 1
        if quizCount < csvArray.count {
        quizArray = csvArray[quizCount].components(separatedBy: ",")
            print("quizです")
        print(quizArray)
            quizImageView.image = quizImageArray[quizCount]
        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        } else {
            performSegue(withIdentifier: "toScoreVC", sender: nil)
        }
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
