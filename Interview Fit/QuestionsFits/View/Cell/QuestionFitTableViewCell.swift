//
//  QuestionFitTableViewCell.swift
//  Interview Fit
//
//  Created by Gustavo Gutierrez Vicente on 24/01/23.
//

import UIKit

protocol QuestionFitTableViewCellDelegate: AnyObject {
  func countPoint(point: Int)
}

class QuestionFitTableViewCell: UITableViewCell {
  
  static let identifier = "QuestionFitTableViewCell"
  weak var delegate: QuestionFitTableViewCellDelegate?
  private var answer = ""
  private var data: QuestionModel?
  
  @IBOutlet private weak var questionLabel: UILabel!
  @IBOutlet private weak var checkFirstQ: CheckBox! {
    didSet {
      checkFirstQ.style = .tick
      checkFirstQ.borderStyle = .rounded
      checkFirstQ.tag = 1
      checkFirstQ.addTarget(self, action: #selector(selectedCheckBox(_:)), for: .valueChanged)
    }
  }
  @IBOutlet private weak var firstQ: UILabel!
  @IBOutlet private weak var checkSecondQ: CheckBox! {
    didSet {
      checkSecondQ.style = .tick
      checkFirstQ.borderStyle = .rounded
      checkSecondQ.tag = 2
      checkSecondQ.addTarget(self, action: #selector(selectedCheckBox(_:)), for: .valueChanged)
    }
  }
  @IBOutlet private weak var secondQ: UILabel!
  @IBOutlet private weak var checkThirdQ: CheckBox!{
    didSet {
      checkThirdQ.style = .tick
      checkFirstQ.borderStyle = .rounded
      checkThirdQ.tag = 3
      checkThirdQ.addTarget(self, action: #selector(selectedCheckBox(_:)), for: .valueChanged)
    }
  }
  @IBOutlet private weak var thirdQ: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  @objc func selectedCheckBox(_ sender: CheckBox) {
    switch sender.tag {
    case 1:
      checkSecondQ.isChecked = false
      checkThirdQ.isChecked = false
      answer = firstQ.text ?? ""
    case 2:
      checkFirstQ.isChecked = false
      checkThirdQ.isChecked = false
      answer = secondQ.text ?? ""
    case 3:
      checkFirstQ.isChecked = false
      checkSecondQ.isChecked = false
      answer = thirdQ.text ?? ""
    default:
      break
    }
    checkFirstQ.isEnabled = (sender.tag == 2 || sender.tag == 3) ? true : false
    checkSecondQ.isEnabled = (sender.tag == 1 || sender.tag == 3) ? true : false
    checkThirdQ.isEnabled = (sender.tag == 1 || sender.tag == 2) ? true : false
    delegate?.countPoint(point: answer == data?.correctAnsw ? 1 : -1)
  }
  
  func configureDataCell(data: QuestionModel){
    self.data = data
    questionLabel.text = data.question
    firstQ.text = data.fistAns
    secondQ.text = data.secAns
    thirdQ.text = data.thirdAns
  }
}
