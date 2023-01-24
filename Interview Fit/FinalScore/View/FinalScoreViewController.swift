//
//  FinalScoreViewController.swift
//  Interview Fit
//
//  Created by Gustavo Gutierrez Vicente on 24/01/23.
//

import UIKit

class FinalScoreViewController: UIViewController {
  
  @IBOutlet private weak var finalScore: UILabel!
  var totalQuestions = 0
  var totalCorrectAnswer = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setScore()
  }
  
  func setScore(){
    finalScore.text = "\(totalCorrectAnswer)/\(totalQuestions)"
  }
  
  func finalScore(questions: Int, Answer: Int){
    self.totalQuestions = questions
    self.totalCorrectAnswer = Answer
  }
  
  
  @IBAction func onClickTakeNewQuiz(_ sender: Any) {
    dismiss(animated: true)
  }
  
  @IBAction func onClickFinish(_ sender: Any) {
    dismiss(animated: true)
  }
}
