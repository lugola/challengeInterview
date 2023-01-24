//
//  QuestionsModel.swift
//  Interview Fit
//
//  Created by Gustavo Gutierrez Vicente on 24/01/23.
//

import Foundation

struct QuestionModel {
  var question: String?
  var fistAns: String?
  var secAns: String?
  var thirdAns: String?
  var correctAnsw: String?
  
  func getData() -> [QuestionModel] {
    let questions = [
      QuestionModel(question: "¿Dónde podemos probar las aplicaciones de Apple para iPhone si no tenemos un dispositivo iOS?",
                    fistAns: "En un idpositivo Android",
                    secAns: "Simulador proporcionado por Xcode",
                    thirdAns: "En un simulador Web",
                    correctAnsw: "Simulador proporcionado por Xcode"),
      QuestionModel(question: "¿Cuál es la primer función que se llama en el ciclo de vida de un ViewController?",
                    fistAns: "viewWillAppear",
                    secAns: "viewDidLoad",
                    thirdAns: "didReceiveMemoryWarning",
                    correctAnsw: "viewDidLoad"),
      QuestionModel(question: " ¿Swift es un lenguaje de programación orientado a objetos?",
                    fistAns: "Si",
                    secAns: "No",
                    thirdAns: "Dependiendo del IDE",
                    correctAnsw: "Si"),
    ]
    return questions
  }
}
