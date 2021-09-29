//
//  MainTableViewCell.swift
//  CarQuizApp
//
//  Created by 内山和輝 on 2021/09/30.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var scoreQuizImageView: UIImageView!
    @IBOutlet weak var scoreQuizTextView: UITextView!
    @IBOutlet weak var scoreAnswerLabel: UILabel!
    @IBOutlet weak var explanation: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
