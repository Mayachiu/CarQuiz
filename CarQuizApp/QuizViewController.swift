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
    
    let quizImageArray1 = [#imageLiteral(resourceName: "11.png"),#imageLiteral(resourceName: "12.png"),#imageLiteral(resourceName: "13.png"),#imageLiteral(resourceName: "14.png"),#imageLiteral(resourceName: "15.png"),#imageLiteral(resourceName: "16.png"),#imageLiteral(resourceName: "17.png"),#imageLiteral(resourceName: "18.png"),#imageLiteral(resourceName: "19.png"),#imageLiteral(resourceName: "20.png")]
    let quizImageArray2 = [#imageLiteral(resourceName: "21.png"), #imageLiteral(resourceName: "22.png"), #imageLiteral(resourceName: "23.png"), #imageLiteral(resourceName: "24.png"), #imageLiteral(resourceName: "25.png"), #imageLiteral(resourceName: "26.png"), #imageLiteral(resourceName: "27.png"), #imageLiteral(resourceName: "28.png"), #imageLiteral(resourceName: "29.png"), #imageLiteral(resourceName: "30.png")]
    let quizImageArray3 = [#imageLiteral(resourceName: "31.png"), #imageLiteral(resourceName: "32.png"), #imageLiteral(resourceName: "33.png"), #imageLiteral(resourceName: "34.png"), #imageLiteral(resourceName: "35.png"), #imageLiteral(resourceName: "36.png"), #imageLiteral(resourceName: "37.png"), #imageLiteral(resourceName: "38.png"), #imageLiteral(resourceName: "39.png"), #imageLiteral(resourceName: "40.png")]
    let quizImageArray4 = [#imageLiteral(resourceName: "41.png"), #imageLiteral(resourceName: "42.png"), #imageLiteral(resourceName: "43.png"), #imageLiteral(resourceName: "44.png"), #imageLiteral(resourceName: "45.png"), #imageLiteral(resourceName: "46.png"), #imageLiteral(resourceName: "47.png"), #imageLiteral(resourceName: "48.png"), #imageLiteral(resourceName: "49.png"), #imageLiteral(resourceName: "50.png")]
    
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    var correctCount = 0
    var selectLebel = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("選択したのはレベル\(selectLebel)")
        if selectLebel == 1 {
            quizImageView.image = quizImageArray1[0]
        } else if selectLebel == 2 {
            quizImageView.image = quizImageArray2[0]
        } else if selectLebel == 3 {
            quizImageView.image = quizImageArray3[0]
        } else if selectLebel == 4 {
            quizImageView.image = quizImageArray4[0]
        }
        
        
        csvArray = loadCSV(fileName: "quiz\(selectLebel)")
        quizArray = csvArray[quizCount].components(separatedBy: ",")
//        print("csvです")
//        print(csvArray)
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
        scoreVC.scoreSelectLabel = selectLebel
        scoreVC.scoreQuizImageArray1 = quizImageArray1
        scoreVC.scoreQuizImageArray2 = quizImageArray2
        scoreVC.scoreQuizImageArray3 = quizImageArray3
        scoreVC.scoreQuizImageArray4 = quizImageArray4
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
//            print("quizです")
//        print(quizArray)
            
            if selectLebel == 1 {
                quizImageView.image = quizImageArray1[quizCount]
            } else if selectLebel == 2 {
                quizImageView.image = quizImageArray2[quizCount]
            } else if selectLebel == 3 {
                quizImageView.image = quizImageArray3[quizCount]
            } else if selectLebel == 4 {
                quizImageView.image = quizImageArray4[quizCount]
            }
            
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
