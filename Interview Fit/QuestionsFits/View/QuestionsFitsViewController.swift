//
//  QuestionsFitsViewController.swift
//  Interview Fit
//
//  Created by Gustavo Gutierrez Vicente on 24/01/23.
//

import UIKit

class QuestionsFitsViewController: UIViewController {
  
  @IBOutlet weak var questionsTable: UITableView!
  
  var correctAnswers = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
  
  func configureTable(){
    questionsTable.delegate = self
    questionsTable.dataSource = self
    questionsTable.register(UINib(nibName: QuestionFitTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: QuestionFitTableViewCell.identifier)
    self.navigationController?.isNavigationBarHidden = true
  }
  
  @IBAction func onClickDismissView(_ sender: Any) {
    self.dismiss(animated: true)
  }
  
  @IBAction func onClickFinishTest(_ sender: Any) {
    let vc = FinalScoreViewController()
    vc.finalScore(questions: QuestionModel().getData().count, Answer: correctAnswers)
    vc.modalPresentationStyle = .fullScreen
    self.navigationController?.pushViewController(vc, animated: true)
  }
}

extension QuestionsFitsViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return QuestionModel().getData().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cellQuestion = tableView.dequeueReusableCell(withIdentifier: QuestionFitTableViewCell.identifier, for: indexPath) as? QuestionFitTableViewCell else {
      return UITableViewCell()
    }
    let data = QuestionModel().getData()[indexPath.row]
    cellQuestion.configureDataCell(data: data)
    cellQuestion.selectionStyle = .none
    cellQuestion.delegate = self
    return cellQuestion
  }
}

extension QuestionsFitsViewController: QuestionFitTableViewCellDelegate {
  func countPoint(point: Int) {
    correctAnswers = correctAnswers + ((correctAnswers == 0 && point == -1) ? 0 : point)
    print(correctAnswers)
  }
}
